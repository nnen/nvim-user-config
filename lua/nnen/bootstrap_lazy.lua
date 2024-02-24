local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.print("Lazy path: " .. lazypath)

if not vim.loop.fs_stat(lazypath) then
	vim.print("Getting lazy.nvim...")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

