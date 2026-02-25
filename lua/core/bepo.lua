-- ~/.config/nvim/init.lua

local map = {
  -- BÉPO → QWERTY (mouvements)
  c = "h", t = "j", s = "k", r = "l",
  -- QWERTY → BÉPO (retour)
  h = "c", j = "t", k = "s", l = "r",
}

local parts = {}
for src, dst in pairs(map) do
  table.insert(parts, src .. ";" .. dst)               -- minuscule
  table.insert(parts, src:upper() .. ";" .. dst:upper()) -- majuscule
end
-- l;r,L;R,h;c,H;C,j;t,J;T,r;l,R;L,k;s,K;S,s;k,S;K,t;j,T;J,c;h,C;H
vim.o.langmap = table.concat(parts, ",")
