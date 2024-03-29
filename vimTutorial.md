Vim tutorial:

# vim commands:
	:wq save and then quit
	:q! quit without saving
	:w to just save
	i insert mode
	a insert mode at right of cursor
	esc for command mode
	v for visual mode
		V for horizontal block
		ctrl+v for verticle block
		
# Command mode (motion):
	by pressing "escape"
	j down
	k up
	l right
	h left
	# (command) ie. 20j will go 20 lines down

	w go to next word
	b previous word
	:# go to a specific line ie. :30 go to line 30
	0 to go to very beginning of the line
		I to go to insert mode at the start of the line
	^ (or 0w) to go to first word of a line
	+ to go the first occurance of the next line (same as j^)
	W ignore punctuation with w
	t(letter) go to one before next letter ie. t! will go to the next !
	f(letter) go to next letter
	T(letter) go to one before previous letter ie. t! will go to the next !
	F(letter) go to previous letter
		use ; to cycle through instances in the same line
		use , to cycle through backwards
	* go to the next instance of the word. very useful for function name etc.
		g* and g# for all instances
	# go to the previous instance of the word.
	% go the the closing bracket (), {},
	$(or A to go into insert mode) to go to the end of the line
		press a to go into insert mode at to insert things at the end
	[num]| col num from the left of the screen only really useful for comments
		start macro
		qq
		10i <esc>
		d18|
		+q
		insert ten spaces, delete to screen column 18

	G to go all the way down
	gg to go all the way up
	} to go down a code block
	{ to go up a code block
	ctrl-d to go half page down
	ctrl-u to go half page up
	'' last line you were at
	
	gj to go down a line on cursor
	gk to go up a line on cursor
	gv to go to previous visual mode selection
	gi to go to previous insert mode location
	g0 to go to beggining of line on cursor location
	g$ to go to end of line on cursor location
	gq [text obj] to format texts that are too long on one line into multiple lines. Very useful for word processing
	gu[text obj] to un-capitalize, guu for the whole line
	gU[text obj] to Capitalize, gUU for the whole line
	g& to run the last :s (substitute command) on the whole document.
	
# Commands:
	cw change word delete the next word and put you in insert mode
	C to delete the rest of the line and put you into insert mode
	ct(letter): replace till the letter and go into insert mode
		ie. ct} replace till next } and go into insert mode
	d+(movement command) ie. d+{ to delete a code block
	dt(letter) delete till the next occurance of the letter, doesn't go into insert mode

	dd to delete line
	x to delete one char
	D to delete to the end of the line
	u to undo
	ctrl+r to redo
	J - join line below to the current one with one space in between

	yy to copy line
	P to paste on cursor
	p to paste line below

	o to add a line below
	O to add a line above

	J accomplishes the opposite by Joining line below with a space
		gJ Join the line below without a space
	~ to switch capitalization or g~[text obj].
    ctrl-a increment numbers by 1
        g-ctrl-a increment numbers in order 1,2,3,4 etc.

# Text Objects:
	iw inner word
	is inner sentence (generally not recommended as no white space)
	i" inner quotes
	ip inner paragraph
	ib inner ()
	iB inner {}
	it inner tag
	i> inner single tag
	aw a block of word including surrounding white space
	as a block of sentence
	ap a block of paragraph
	aw a block of word
	ab a block of with ()
	aB a block of with {}
	at a block of with tags
	a> a single tag
	' single quotes
	" double quotes
	[ or ]
	{ or }
	( or )
	< or >

# In insert Mode:
	Ctrl + j begin new line during insert mode
	Ctrl + t indent (move right) line one shiftwidth during insert mode
	Ctrl + d de-indent (move left) line one shiftwidth during insert mode
    Ctrl + w delete word

# Registers:
	"+[command] system clipboard, "+y copys visual mode text into system clipboard
	""[command] last delete or yank
	"0[command] last yank
	"[1-9][command] last 9 deletion from 0 (youngest) to 9 (oldest)
	ctrl-r[register] Insert Mode ONLY, paste register. ie. ctrl-r" pasting last yank/delete.
	read only:
		". last inserted text
		"% file path
		": is the most recently executed command. If you save the current buffer with :w, “w” will be in this register.
		"# last edited file. vim uses this when you do ctrl-^
		

# misc:
	zz to center your curser useful when the cursor is on top/bottom of the screen
	~ to switch case. upper to lower or vise versa
	. to do the previous command again
	r(letter) replace cursor with letter
	>> to indent
	<< to left indent
	:set spell!  to start spell check
		]s next spelling error
		[s previous spelling error
		z= when you're on a mis-spelled word to correct it
			1z= vim's first spelling suggestion
		zg add unknown word to dictionary
			zug to remove the word from dictionary
		
# Search:
	/pattern will search for that pattern
		n for next
		N for previous
		type ':set [value]'
			'is' 'incsearch'        show partial matches for a search phrase
			'hls' 'hlsearch'        highlight all matching phrases
			:hi Search cterm=NONE ctermfg=black ctermbg=yellow 	better highlight
			'ignorecase' 	no case match
			'ignorecase!'	case match
		cgn[words] change next occurance of search to words
	?pattern will search for that pattern going backwards
		n for next
		N for previous

	:s (line) or :%s. :%s/pattern/replace/g (whole doc) substitute text
		:2s/1 2/2 1/gc change line 2 from (1 2) to (2 1), /g means greedy (multiple matches), c meaning confirmation needed it ask you permission everytime
		at the end:
			/g greedy multiple matches
			/p print it out
			/j join next line
		() cature group use \1, \2 in subs :%s/\(\w\) and/\1 but not/g

	:g or :10,+5g (line 10 to 15). :g/./s/pattern/replace/g get and execute command
		:g/1 2/p print out all lines with (1 2)
	:j join line

# Macros:
	q(letter) to start recording a macro to the letter
		then do a bunch of things you want to record
		end it in command mode by pressing q again
		This will save the commands in to @(Capital Letter)
		ie. qw saves the command to @W
		by pressing @(capital letter) you can do the macro
		combining it with #@(capital letter) ie. 20@W you can repeat the macro 20 times

# Auto completion: (^means ctrl)
	^p to autocomplete a word.
	^x^l to autocomplete a line
	^x^f to autocomplete a file search ( /home/ )

# file system:
	:e [filename] to edit file
	^o previous file
	^i next file

# marks:
	m[letter] to save a mark at cursor
		use marks for local (ie. :'a, 'bs/[substitute]/[another]/gc
        *try to use capital letter for global nav.
	`[letter] to go to that mark
	`` return to previous location of a movment ie. G, gg, search
	ctrl-^ return to previous buffer

# Advanced commands:
    :norm runs a normal command ie. :norm I<br>
    :! runs a bash command
    :read to read the output from other commands
    	:read !ls    will read all of the filenames
    
# surround.vim:
	ys add surround
	ds delete
	cs change
	yss) add surround, s for entire line, ) to add brackets
	ys2aw) add surround, 2 things, aw words, ) to add )
	dst delete surrounding tags
	cs") change surround quotes into brackets
	cst<em> change surround tag into <em>
	veeeS) v enter visual mode, e end of word, S enter surround mode, replace )
	
it is useful for deletion to use a instead of i.

example = (['one thing', 'other thing'], 2)


# NerdCommenter:
	[count]<leader>c<space> toggle comment
	[count]<leader>cc Comment out the current line or text selected in visual mode.
	[count]<leader>ci Toggles the comment state of the selected line(s) individually.
	[count]<leader>cs nice formated blocks
