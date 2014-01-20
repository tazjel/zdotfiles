
let s:save_cpo = &cpo
set cpo&vim

function! mlterm#encoding#define_syntax()
  call s:define_keywords()
  call s:define_highlights()
endfunction

function! s:define_keywords()
  syntax match mltermEncoding  "\v\cutf-8"
  syntax match mltermEncoding  "\v\cISO-8859-[1-11]"
  " syntax match mltermEncoding  "\v\cISO-8859-[13-16]"
  syntax match mltermEncoding  "\v\cTIS-620"
  syntax match mltermEncoding  "\v\c KOI8-[RUT]"
  syntax match mltermEncoding  "\v\cISCII"
  syntax match mltermEncoding  "\v\cVISCII"
  syntax match mltermEncoding  "\v\cTCVN5712"
  syntax match mltermEncoding  "\v\cGEORGIAN_PS"
  syntax match mltermEncoding  "\v\cCP125[0-8]"
  syntax match mltermEncoding  "\v\cCP874"
  syntax match mltermEncoding  "\v\c EUC-JP"
  syntax match mltermEncoding  "\v\cEUC-JISX0213"
  syntax match mltermEncoding  "\v\cShift_JIS"
  syntax match mltermEncoding  "\v\cShift_JISX0213"
  syntax match mltermEncoding  "\v\cISO-2022-JP[1-3]"
  syntax match mltermEncoding  "\v\cEUC-KR"
  syntax match mltermEncoding  "\v\cUHC"
  syntax match mltermEncoding  "\v\cJOHAB"
  syntax match mltermEncoding  "\v\cISO-2022-KR"
  syntax match mltermEncoding  "\v\cGB2312"
  syntax match mltermEncoding  "\v\cGBK"
  syntax match mltermEncoding  "\v\cGB18030"
  syntax match mltermEncoding  "\v\cISO-2022-CN"
  syntax match mltermEncoding  "\v\cHZ"
  syntax match mltermEncoding  "\v\cEUC-TW"
  syntax match mltermEncoding  "\v\cBIG5"
  syntax match mltermEncoding  "\v\cBIG5HKSCS"
  syntax match mltermEncoding  "\v\cUTF-8"
  syntax match mltermEncoding  "\v\cAUTO"
endfunction

function! s:define_highlights()
  hi def link mltermEncoding      Constant
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
