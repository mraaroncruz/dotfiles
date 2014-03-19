call NERDTreeAddKeyMap({
	   \ 'key': 'w',
	   \ 'callback': 'NERDTreeToggleWidth',
	   \ 'quickhelpText': 'Toggle window width' })

function! NERDTreeToggleWidth()
	let l:maxi = 0
	for l:z in range(1, line("$"))
		let l:aktlen = len(getline(l:z))
		if l:aktlen > l:maxi
			let l:maxi = l:aktlen
		endif
	endfor
	exe "vertical resize " . (l:maxi == winwidth(".") ? g:NERDTreeWinSize : l:maxi)
endfunction
