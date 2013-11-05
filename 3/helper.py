# Get the absolute path of this project
#import os, sys
#google_api_path = "/home/jonathan/openshot/openshot/uploads/youtube"
#if google_api_path not in sys.path:
#	sys.path.append(google_api_path)

import getopt
import mimetypes
import os.path
import atom.data
import gdata.youtube
import gdata.youtube.service
import gdata.client
import gdata.data
import gdata.gauth
import gdata.youtube.client
import gdata.youtube.data
import gdata.sample_util

APP_NAME = 'openshot-video-editor'


def get_mimetype(filename):
	file_ext = filename[filename.rfind('.'):]
	if file_ext in mimetypes.types_map:
		content_type = mimetypes.types_map[file_ext]
	else:
		content_type = raw_input("Unrecognized file extension. Please enter the file's content type: ")
	return content_type


class ResumableUploadDemo(object):
	"""Helper class to setup a resumable upload, and upload a file."""

	CREATE_SESSION_URI = '/resumable/feeds/api/users/default/uploads'

	client = None	# A gdata.client.GDClient object.
	uploader = None	# A gdata.client.ResumableUploader object.

	def __init__(self, filepath, chunk_size=1024*64, convert=None,	host=None, ssl=False, debug=False, username=None, password=None):

		self.client = gdata.youtube.client.YouTubeClient(source=APP_NAME)
		self.client.ssl = ssl
		self.client.http_client.debug = debug
		self.convert = convert

		if host:
			self.client.host = host

		if chunk_size:
			self.chunk_size = chunk_size

		# Authenticate the user with CLientLogin, OAuth, or AuthSub.
		self.client.ClientLogin(username, password, self.client.source);

		mimetypes.init()	# Register common mimetypes on system.

		self.f = open(filepath)
		content_type = get_mimetype(self.f.name)
		file_size = os.path.getsize(self.f.name)

		self.uploader = gdata.client.ResumableUploader(
			self.client, self.f, content_type, file_size,
			chunk_size=self.chunk_size, desired_class=gdata.youtube.data.VideoEntry)

	def __del__(self):
		if self.uploader is not None:
			self.uploader.file_handle.close()

	def UploadAutomaticChunks(self, new_entry, slug, on_chunk_complete=None):
		"""Uploads an entire file, handing the chunking for you.

		Args:
			new_entry: gdata.data.docs.DocsEntry An object holding metadata to create
				the document with.

		Returns:
			A gdata.docs.data.DocsEntry of the created document on the server.
		"""
		uri = self.CREATE_SESSION_URI

		# If convert=false is used on the initial request to start a resumable
		# upload, the document will be treated as arbitrary file upload.
		if self.convert is not None:
			uri += '?convert=' + self.convert

		developer_key = "AI39si7GN9BuTSDBx8pM-nj7urP132xFmA6DjgzSj3Wb4qfw-qEvUN1ngCURZ6SwzXi-q8FkA3SV_QHjgXvCai5crIzcueYWUQ"
		return self.uploader.UploadFile(uri, entry=new_entry, headers={"X-GData-Key": "key=%s" % developer_key,
																	   "Slug": slug})

	def UploadInManualChunks(self, new_entry, slug, on_chunk_complete=None):
		"""Uploads a file, demonstrating manually chunking the file.

		Args:
			new_entry: gdata.data.docs.DocsEntry An object holding metadata to create
				the document with.

		Returns:
			A gdata.docs.data.DocsEntry of the created document on the server.
		"""
		uri = self.CREATE_SESSION_URI

		# If convert=false is used on the initial request to start a resumable
		# upload, the document will be treated as arbitrary file upload.
		if self.convert is not None:
			uri += '?convert=' + self.convert

		developer_key = "AI39si7GN9BuTSDBx8pM-nj7urP132xFmA6DjgzSj3Wb4qfw-qEvUN1ngCURZ6SwzXi-q8FkA3SV_QHjgXvCai5crIzcueYWUQ"

		# Need to create the initial session manually.
		self.uploader._InitSession(uri, entry=new_entry, headers={"X-GData-Key": "key=%s" % developer_key,
																	   "Slug": slug})

		start_byte = 0
		entry = None

		while not entry:
			#print 'Uploading bytes: %s-%s/%s' % (start_byte,
			#									self.uploader.chunk_size - 1,
			#									self.uploader.total_file_size)
			entry = self.uploader.UploadChunk(start_byte, self.uploader.file_handle.read(self.uploader.chunk_size))
			start_byte += self.uploader.chunk_size

			# invoke on_chunk_complete method
			if on_chunk_complete:
				on_chunk_complete(self.uploader.total_file_size, start_byte)

		return entry

	def UploadUsingNormalPath(self):
		"""Uploads a file using the standard DocList API upload path.

		This method is included to show the difference between the standard upload
		path and the resumable upload path. Also note, file uploads using this
		normal upload method max out ~10MB.

		Returns:
			A gdata.docs.data.DocsEntry of the created document on the server.
		"""
		ms = gdata.data.MediaSource(
			file_handle=self.f, content_type=self.uploader.content_type,
			content_length=self.uploader.total_file_size)

		uri = self.client.DOCLIST_FEED_URI

		# If convert=false is used on the initial request to start a resumable
		# upload, the document will be treated as arbitrary file upload.
		if self.convert is not None:
			uri += '?convert=' + self.convert

		return self.client.Upload(ms, self.f.name, folder_or_uri=uri)


def main():

	filepath = "/home/jonathan/Desktop/Video1.mp4"
	convert = 'false'	# Convert to Google Docs format by default
	chunk_size = 1024*64
	debug = False
	ssl = False

	# prepare a media group object to hold our video's meta-data
	my_media_group = gdata.media.Group(
	  title=gdata.media.Title(text="Test Video Resumable 2"),
	  description=gdata.media.Description(description_type='plain',
	                                      text="Description for Test Video Resumable 2"),
	  keywords=gdata.media.Keywords(text=''),
	  category=[gdata.media.Category(
	      text='People',
	      scheme='http://gdata.youtube.com/schemas/2007/categories.cat',
	      label='People')],
	  player=None
	)

	# create the gdata.youtube.YouTubeVideoEntry to be uploaded
	video_entry = gdata.youtube.YouTubeVideoEntry(media=my_media_group)

	demo = ResumableUploadDemo(filepath, chunk_size=chunk_size, convert=convert, ssl=ssl, debug=debug, host="uploads.gdata.youtube.com", username=None, password=None)

	print 'Uploading %s ( %s ) @ %s bytes...' % (demo.uploader.file_handle.name,
												demo.uploader.content_type,
												demo.uploader.total_file_size)

	#entry = demo.UploadAutomaticChunks(video_entry)
	entry = demo.UploadInManualChunks(video_entry, "Video1.mp4")


if __name__ == '__main__':
	main()
