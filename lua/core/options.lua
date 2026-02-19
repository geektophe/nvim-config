local opt = vim.opt -- raccourci pour un peu plus de concision

-- numéros de ligne
-- opt.relativenumber = true -- affichage des numéros de ligne relatives à la position actuelle du curseur
opt.number = true -- affiche le numéro absolu de la ligne active lorsque que relativenumber est activé

-- tabs & indentation
opt.tabstop = 4       -- 2 espaces pour les tabulations
opt.shiftwidth = 4    -- 2 espaces pour la taille des indentations
opt.expandtab = true  -- change les tabulations en espaces (don't feed the troll please ;) )
opt.autoindent = true -- on garde l'indentation actuelle à la prochaine ligne

-- recherche
-- opt.ignorecase = true -- ignore la casse quand on recherche
-- opt.smartcase = true -- sauf quand on fait une recherche avec des majuscules, on rebascule en sensible à la casse
opt.hlsearch = true -- surlignage de toutes les occurences de la recherche en cours

-- ligne du curseur
opt.cursorline = true -- surlignage de la ligne active

-- apparence

-- termguicolors est nécessaire pour que les thèmes modernes fonctionnent
opt.termguicolors = true
opt.background = "dark" -- dark ou light en fonction de votre préférence
opt.signcolumn = "yes"  -- affiche une colonne en plus à gauche pour afficher les signes (évite de décaler le texte)

-- retour
opt.backspace = "indent,eol,start" -- on autorise l'utilisation de retour quand on indente, à la fin de ligne ou au début

-- presse papier
-- opt.clipboard = "unnamedplus" -- on utilise le presse papier du système par défaut
-- no copy to clipboard
opt.clipboard = ""

-- split des fenêtres
opt.splitright = true     -- le split vertical d'une fenêtre s'affiche à droite
opt.splitbelow = true     -- le split horizontal d'une fenêtre s'affiche en bas

opt.swapfile = false      -- on supprime le pénible fichier de swap

opt.undofile = true       -- on autorise l'undo à l'infini (même quand on revient sur un fichier qu'on avait fermé)

opt.iskeyword:append("-") -- on traite les mots avec des - comme un seul mot

-- affichage des caractères spéciaux
-- opt.list = true
-- opt.listchars:append({ nbsp = "␣", trail = "•", precedes = "«", extends = "»", tab = "> " })

-- no mouse interaction
opt.mouse = ""

-- backup dir
opt.backupdir = "~/.vim/backup,~/,."
opt.directory = "~/.vim/tmp,~/,."

-- Enable 24-bit RGB colors
vim.o.termguicolors = true

-- Syntax highlighting and filetype plugins
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Tell vim to remember certain things when we exit
--  '10  :  marks will be remembered for up to 10 previously edited files
--  "100 :  will save up to 100 lines for each register
--  :20  :  up to 20 lines of command-line history will be remembered
--  %    :  saves and restores the buffer list
--  n... :  where to save the viminfo files
-- opt.viminfo = "10,\"100,:20,%,n~/.viminfo"
