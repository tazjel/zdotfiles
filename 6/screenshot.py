 def screenshot(self, id):
       i = model.Screenshot.get(id)
       if i:
           im = Image.open(StringIO(i.image))
           pylons.response.headers['Content-Type'] = "image/%s" % (im.format and
im.format.lower() or 'bmp')
           pylons.response.headers['Content-length'] = "%s" % len(i.image)
           if request.params.has_key('thumb') and request.params['thumb'] ==
"True":
               im.thumbnail(THUMB_SIZE, Image.ANTIALIAS)
           w = StringIO()
           im.save(w, im.format)
           return str(w.getvalue())
       abort(404)