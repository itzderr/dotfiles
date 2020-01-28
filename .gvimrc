" set macligatures
set guifont=JetBrainsMono\ Nerd\ Font:h15

" dark mode enabled?
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
   set background=dark
else
  set background=light
endif
