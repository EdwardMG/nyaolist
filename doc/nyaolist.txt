*nyaolist*

INTRODUCTION

Arbitrary lists of things for doing similar things to quickfix/location lists.

Requires rubywrapper plugin.

USAGE

Initialize like

$some_name = NyaoList.new
or
$some_name = NyaoList.new some_array

<Commands>

<Functions>

NyaoList#<<
  add an element to the end of the list

NyaoList#concat
  add elements to the end of the list

NyaoList#add_current_file
  add the current file to the end of the list

NyaoList#macro_each
  run a macro on each file and write, starting the macro on the first line

NyaoList#godo cmd
  run an ex command on each file and write

vim:autoindent noexpandtab tabstop=8 shiftwidth=8
vim:se modifiable
vim:tw=78:et:ft=help:norl:
