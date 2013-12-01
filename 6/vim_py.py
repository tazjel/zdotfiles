python << EOL
import vim, StringIO,sys
def PyExecAppend(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  exec('\n'.join(r[:]) + '\n')
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r.append(output[:-1]) # the -1 is to remove the final blank line
  redirected.close()

def PyExecReplace(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  exec('\n'.join(r[:]) + '\n')
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r[:] = output[:-1] # the -1 is to remove the final blank line
  redirected.close()
EOL
command -range Pyer python PyExecReplace(<f-line1>,<f-line2>)
command -range Pyea python PyExecAppend(<f-line1>,<f-line2>)

