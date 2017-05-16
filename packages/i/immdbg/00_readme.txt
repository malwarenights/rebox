Download:
http://www.immunityinc.com/products/debugger/
http://debugger.immunityinc.com/ID_register.py
http://debugger.immunityinc.com/getID.py?hash=24ea99b8071253c867474794cc7fc61b275cd08f
http://debugger.immunityinc.com/LICENSE.txt
http://debugger.immunityinc.com/update/Documentation/ref/
https://github.com/kbandla/ImmunityDebugger

Tutorials:
http://sgros-students.blogspot.com/2014/05/immunity-debugger-basics-part-1.html
http://sgros-students.blogspot.com/2014/09/immunity-debugger-basics-part-2.html
http://sgros-students.blogspot.com/2014/10/reversing-with-immunity-debugger-part2.html
http://sgros-students.blogspot.com/2014/09/reversing-with-immunity-debugger.html


http://stackoverflow.com/questions/14782161/disassembling-a-function-with-immunity-debugger
module = imm.getModule('calc.exe')
if not module.isAnalysed():
    module.Analyse()
functions = imm.getAllFunctions(module.getBase())
# functions is a list of function addresses in calc.exe

imm.searchFunctionByName('name_to_search')



http://vrt-blog.snort.org/2014/04/using-immunity-debugger-api-to-automate.html
http://web.archive.org/web/20151125190038/http://blog.talosintel.com/2014/04/using-immunity-debugger-api-to-automate.html
http://web.archive.org/web/20150829081443/http://vrt-blog.snort.org/2014/04/using-immunity-debugger-api-to-automate.html
https://www.corelan.be/index.php/2010/01/26/starting-to-write-immunity-debugger-pycommands-my-cheatsheet/
https://www.defcon.org/images/defcon-15/dc15-presentations/dc-15-gomez.pdf

Plugins:
http://takahiroharuyama.github.io/downloads/scripts/blackmanta.py
    blackmanta slightly-changed version for Immunity Debugger v1.8

http://takahiroharuyama.github.io/downloads/scripts/immbone_nx.zip
    immbone_nx break on execute script on DEP environment (enable DEP and uncheck the option ignoring Memory access violation in the debugger settings)

http://takahiroharuyama.github.io/downloads/scripts/immbone.zip
    immbone break on execute script on non-DEP environment (disable DEP and uncheck the option ignoring single-step break in the debugger settings)



Other downloads:

https://github.com/kbandla/ImmunityDebuggerScripts/tree/master/PyCommands
https://github.com/fireeye/pycommands
https://github.com/leakerlee/immDBG.pyscript
https://github.com/theevilbit/immunity_scripts
https://github.com/theevilbit/immunity_scripts/blob/master/patch_antidbg.py
https://github.com/cherry-wb/monalisa
https://github.com/sumit-1/immunity_dbg_plugins - bchunter.py
https://github.com/adrianherrera/immdbg-pycommands/blob/master/PyCommands/memhash.py
https://github.com/MalWerewolf/autobreak-api/blob/master/autobreak-api.py
https://github.com/escube/shellcode_badchar/blob/master/badchars.py
https://github.com/aking1012/bindiff-ruby


https://github.com/sha8e/muffi/tree/master/muffi

https://twitter.com/afrocheese/status/619176939291549696
!mona findwild -cpb '\x00..\x20\x7f..\xff' -s pop ecx#retn
