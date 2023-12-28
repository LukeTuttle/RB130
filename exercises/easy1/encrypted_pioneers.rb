LETTERS = ('a'..'z').to_a

def rot13(string)
  string.chars.map do |char|
    char_index = LETTERS.index(char.downcase)
    next char if char_index.nil?

    new_char = LETTERS[(char_index + 13) % 26]
    char == char.upcase ? new_char.upcase : new_char
  end.join
end

names = <<HEREDOC
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
HEREDOC

puts names.split("\n").map {|name| rot13(name)}

