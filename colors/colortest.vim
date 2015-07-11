" Vim script for testing colors
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Contributors: Rafael Garcia-Suarez, Charles Campbell
" Last Change:  2006 Feb 20

" edit this file, then do ":source %", and check if the colors match

"   0 black             black_on_white          white_on_black
"                       black_on_black          black_on_black
"   1 darkred           darkred_on_white        white_on_darkred
"                       darkred_on_black        black_on_darkred
"   2 darkgreen         darkgreen_on_white      white_on_darkgreen
"                       darkgreen_on_black      black_on_darkgreen
"   3 color_3 		3_on_white		white_on_3
"                       3_on_black		black_on_3
" 130 brown             brown_on_white          white_on_brown
"                       brown_on_black          black_on_brown
"   4 darkblue          darkblue_on_white       white_on_darkblue
"                       darkblue_on_black       black_on_darkblue
"   5 darkmagenta       darkmagenta_on_white    white_on_darkmagenta
"                       darkmagenta_on_black    black_on_darkmagenta
"   6 darkcyan          darkcyan_on_white       white_on_darkcyan
"                       darkcyan_on_black       black_on_darkcyan
"   7 lightgray         lightgray_on_white      white_on_lightgray
"                       lightgray_on_black      black_on_lightgray
"   8 color_8 		8_on_white		white_on_8
"                       8_on_black		black_on_8
" 242 darkgray          darkgray_on_white       white_on_darkgray
"                       darkgray_on_black       black_on_darkgray
"   9 red               red_on_white            white_on_red
"                       red_on_black            black_on_red
"  10 green             green_on_white          white_on_green
"                       green_on_black          black_on_green
"  11 yellow            yellow_on_white         white_on_yellow
"                       yellow_on_black         black_on_yellow
"  12 blue              blue_on_white           white_on_blue
"                       blue_on_black           black_on_blue
"  13 magenta           magenta_on_white        white_on_magenta
"                       magenta_on_black        black_on_magenta
"  14 cyan              cyan_on_white           white_on_cyan
"                       cyan_on_black           black_on_cyan
"  15 white             white_on_white          white_on_white
"                       white_on_black          black_on_white
" 248 grey              grey_on_white           white_on_grey
"                       grey_on_black           black_on_grey
" 224 lightred          lightred_on_white       white_on_lightred
"                       lightred_on_black       black_on_lightred
" 121 lightgreen        lightgreen_on_white     white_on_lightgreen
"                       lightgreen_on_black     black_on_lightgreen
" 229 lightyellow       lightyellow_on_white    white_on_lightyellow
"                       lightyellow_on_black    black_on_lightyellow
"  81 lightblue         lightblue_on_white      white_on_lightblue
"                       lightblue_on_black      black_on_lightblue
" 225 lightmagenta      lightmagenta_on_white   white_on_lightmagenta
"                       lightmagenta_on_black   black_on_lightmagenta
" 159 lightcyan         lightcyan_on_white      white_on_lightcyan
"                       lightcyan_on_black      black_on_lightcyan
"  16 color_16		16_on_white		white_on_16
"                       16_on_black		black_on_16
"  17 color_17          17_on_white             white_on_17
"                       17_on_black             black_on_17
"  18 color_18          18_on_white             white_on_18
"                       18_on_black             black_on_18
"  19 color_19          19_on_white             white_on_19
"                       19_on_black             black_on_19
"  20 color_20          20_on_white             white_on_20
"                       20_on_black             black_on_20
"  21 color_21          21_on_white             white_on_21
"                       21_on_black             black_on_21
"  22 color_22          22_on_white             white_on_22
"                       22_on_black             black_on_22
"  23 color_23          23_on_white             white_on_23
"                       23_on_black             black_on_23
"  24 color_24          24_on_white             white_on_24
"                       24_on_black             black_on_24
"  25 color_25          25_on_white             white_on_25
"                       25_on_black             black_on_25
"  26 color_26          26_on_white             white_on_26
"                       26_on_black             black_on_26
"  27 color_27          27_on_white             white_on_27
"                       27_on_black             black_on_27
"  28 color_28          28_on_white             white_on_28
"                       28_on_black             black_on_28
"  29 color_29          29_on_white             white_on_29
"                       29_on_black             black_on_29
"  30 color_30          30_on_white             white_on_30
"                       30_on_black             black_on_30
"  31 color_31          31_on_white             white_on_31
"                       31_on_black             black_on_31
"  32 color_32          32_on_white             white_on_32
"                       32_on_black             black_on_32
"  33 color_33          33_on_white             white_on_33
"                       33_on_black             black_on_33
"  34 color_34          34_on_white             white_on_34
"                       34_on_black             black_on_34
"  35 color_35          35_on_white             white_on_35
"                       35_on_black             black_on_35
"  36 color_36          36_on_white             white_on_36
"                       36_on_black             black_on_36
"  37 color_37          37_on_white             white_on_37
"                       37_on_black             black_on_37
"  38 color_38          38_on_white             white_on_38
"                       38_on_black             black_on_38
"  39 color_39          39_on_white             white_on_39
"                       39_on_black             black_on_39
"  40 color_40          40_on_white             white_on_40
"                       40_on_black             black_on_40
"  41 color_41          41_on_white             white_on_41
"                       41_on_black             black_on_41
"  42 color_42          42_on_white             white_on_42
"                       42_on_black             black_on_42
"  43 color_43          43_on_white             white_on_43
"                       43_on_black             black_on_43
"  44 color_44          44_on_white             white_on_44
"                       44_on_black             black_on_44
"  45 color_45          45_on_white             white_on_45
"                       45_on_black             black_on_45
"  46 color_46          46_on_white             white_on_46
"                       46_on_black             black_on_46
"  47 color_47          47_on_white             white_on_47
"                       47_on_black             black_on_47
"  48 color_48          48_on_white             white_on_48
"                       48_on_black             black_on_48
"  49 color_49          49_on_white             white_on_49
"                       49_on_black             black_on_49
"  50 color_50          50_on_white             white_on_50
"                       50_on_black             black_on_50
"  51 color_51          51_on_white             white_on_51
"                       51_on_black             black_on_51
"  52 color_52          52_on_white             white_on_52
"                       52_on_black             black_on_52
"  53 color_53          53_on_white             white_on_53
"                       53_on_black             black_on_53
"  54 color_54          54_on_white             white_on_54
"                       54_on_black             black_on_54
"  55 color_55          55_on_white             white_on_55
"                       55_on_black             black_on_55
"  56 color_56          56_on_white             white_on_56
"                       56_on_black             black_on_56
"  57 color_57          57_on_white             white_on_57
"                       57_on_black             black_on_57
"  58 color_58          58_on_white             white_on_58
"                       58_on_black             black_on_58
"  59 color_59          59_on_white             white_on_59
"                       59_on_black             black_on_59
"  60 color_60          60_on_white             white_on_60
"                       60_on_black             black_on_60
"  61 color_61          61_on_white             white_on_61
"                       61_on_black             black_on_61
"  62 color_62          62_on_white             white_on_62
"                       62_on_black             black_on_62
"  63 color_63          63_on_white             white_on_63
"                       63_on_black             black_on_63
"  64 color_64          64_on_white             white_on_64
"                       64_on_black             black_on_64
"  65 color_65          65_on_white             white_on_65
"                       65_on_black             black_on_65
"  66 color_66          66_on_white             white_on_66
"                       66_on_black             black_on_66
"  67 color_67          67_on_white             white_on_67
"                       67_on_black             black_on_67
"  68 color_68          68_on_white             white_on_68
"                       68_on_black             black_on_68
"  69 color_69          69_on_white             white_on_69
"                       69_on_black             black_on_69
"  70 color_70          70_on_white             white_on_70
"                       70_on_black             black_on_70
"  71 color_71          71_on_white             white_on_71
"                       71_on_black             black_on_71
"  72 color_72          72_on_white             white_on_72
"                       72_on_black             black_on_72
"  73 color_73          73_on_white             white_on_73
"                       73_on_black             black_on_73
"  74 color_74          74_on_white             white_on_74
"                       74_on_black             black_on_74
"  75 color_75          75_on_white             white_on_75
"                       75_on_black             black_on_75
"  76 color_76          76_on_white             white_on_76
"                       76_on_black             black_on_76
"  77 color_77          77_on_white             white_on_77
"                       77_on_black             black_on_77
"  78 color_78          78_on_white             white_on_78
"                       78_on_black             black_on_78
"  79 color_79          79_on_white             white_on_79
"                       79_on_black             black_on_79
"  80 color_80          80_on_white             white_on_80
"                       80_on_black             black_on_80
"  81 color_81          81_on_white             white_on_81
"                       81_on_black             black_on_81
"  82 color_82          82_on_white             white_on_82
"                       82_on_black             black_on_82
"  83 color_83          83_on_white             white_on_83
"                       83_on_black             black_on_83
"  84 color_84          84_on_white             white_on_84
"                       84_on_black             black_on_84
"  85 color_85          85_on_white             white_on_85
"                       85_on_black             black_on_85
"  86 color_86          86_on_white             white_on_86
"                       86_on_black             black_on_86
"  87 color_87          87_on_white             white_on_87
"                       87_on_black             black_on_87
"  88 color_88          88_on_white             white_on_88
"                       88_on_black             black_on_88
"  89 color_89          89_on_white             white_on_89
"                       89_on_black             black_on_89
"  90 color_90          90_on_white             white_on_90
"                       90_on_black             black_on_90
"  91 color_91          91_on_white             white_on_91
"                       91_on_black             black_on_91
"  92 color_92          92_on_white             white_on_92
"                       92_on_black             black_on_92
"  93 color_93          93_on_white             white_on_93
"                       93_on_black             black_on_93
"  94 color_94          94_on_white             white_on_94
"                       94_on_black             black_on_94
"  95 color_95          95_on_white             white_on_95
"                       95_on_black             black_on_95
"  96 color_96          96_on_white             white_on_96
"                       96_on_black             black_on_96
"  97 color_97          97_on_white             white_on_97
"                       97_on_black             black_on_97
"  98 color_98          98_on_white             white_on_98
"                       98_on_black             black_on_98
"  99 color_99          99_on_white             white_on_99
"                       99_on_black             black_on_99
" 100 color_100         100_on_white             white_on_100
"                       100_on_black             black_on_100
" 101 color_101         101_on_white             white_on_101
"                       101_on_black             black_on_101
" 102 color_102         102_on_white             white_on_102
"                       102_on_black             black_on_102
" 103 color_103         103_on_white             white_on_103
"                       103_on_black             black_on_103
" 104 color_104         104_on_white             white_on_104
"                       104_on_black             black_on_104
" 105 color_105         105_on_white             white_on_105
"                       105_on_black             black_on_105
" 106 color_106         106_on_white             white_on_106
"                       106_on_black             black_on_106
" 107 color_107         107_on_white             white_on_107
"                       107_on_black             black_on_107
" 108 color_108         108_on_white             white_on_108
"                       108_on_black             black_on_108
" 109 color_109         109_on_white             white_on_109
"                       109_on_black             black_on_109
" 110 color_110         110_on_white             white_on_110
"                       110_on_black             black_on_110
" 111 color_111         111_on_white             white_on_111
"                       111_on_black             black_on_111
" 112 color_112         112_on_white             white_on_112
"                       112_on_black             black_on_112
" 113 color_113         113_on_white             white_on_113
"                       113_on_black             black_on_113
" 114 color_114         114_on_white             white_on_114
"                       114_on_black             black_on_114
" 115 color_115         115_on_white             white_on_115
"                       115_on_black             black_on_115
" 116 color_116         116_on_white             white_on_116
"                       116_on_black             black_on_116
" 117 color_117         117_on_white             white_on_117
"                       117_on_black             black_on_117
" 118 color_118         118_on_white             white_on_118
"                       118_on_black             black_on_118
" 119 color_119         119_on_white             white_on_119
"                       119_on_black             black_on_119
" 120 color_120         120_on_white             white_on_120
"                       120_on_black             black_on_120
" 121 color_121         121_on_white             white_on_121
"                       121_on_black             black_on_121
" 122 color_122         122_on_white             white_on_122
"                       122_on_black             black_on_122
" 123 color_123         123_on_white             white_on_123
"                       123_on_black             black_on_123
" 124 color_124         124_on_white             white_on_124
"                       124_on_black             black_on_124
" 125 color_125         125_on_white             white_on_125
"                       125_on_black             black_on_125
" 126 color_126         126_on_white             white_on_126
"                       126_on_black             black_on_126
" 127 color_127         127_on_white             white_on_127
"                       127_on_black             black_on_127
" 128 color_128         128_on_white             white_on_128
"                       128_on_black             black_on_128
" 129 color_129         129_on_white             white_on_129
"                       129_on_black             black_on_129
" 130 color_130         130_on_white             white_on_130
"                       130_on_black             black_on_130
" 131 color_131         131_on_white             white_on_131
"                       131_on_black             black_on_131
" 132 color_132         132_on_white             white_on_132
"                       132_on_black             black_on_132
" 133 color_133         133_on_white             white_on_133
"                       133_on_black             black_on_133
" 134 color_134         134_on_white             white_on_134
"                       134_on_black             black_on_134
" 135 color_135         135_on_white             white_on_135
"                       135_on_black             black_on_135
" 136 color_136         136_on_white             white_on_136
"                       136_on_black             black_on_136
" 137 color_137         137_on_white             white_on_137
"                       137_on_black             black_on_137
" 138 color_138         138_on_white             white_on_138
"                       138_on_black             black_on_138
" 139 color_139         139_on_white             white_on_139
"                       139_on_black             black_on_139
" 140 color_140         140_on_white             white_on_140
"                       140_on_black             black_on_140
" 141 color_141         141_on_white             white_on_141
"                       141_on_black             black_on_141
" 142 color_142         142_on_white             white_on_142
"                       142_on_black             black_on_142
" 143 color_143         143_on_white             white_on_143
"                       143_on_black             black_on_143
" 144 color_144         144_on_white             white_on_144
"                       144_on_black             black_on_144
" 145 color_145         145_on_white             white_on_145
"                       145_on_black             black_on_145
" 146 color_146         146_on_white             white_on_146
"                       146_on_black             black_on_146
" 147 color_147         147_on_white             white_on_147
"                       147_on_black             black_on_147
" 148 color_148         148_on_white             white_on_148
"                       148_on_black             black_on_148
" 149 color_149         149_on_white             white_on_149
"                       149_on_black             black_on_149
" 150 color_150         150_on_white             white_on_150
"                       150_on_black             black_on_150
" 151 color_151         151_on_white             white_on_151
"                       151_on_black             black_on_151
" 152 color_152         152_on_white             white_on_152
"                       152_on_black             black_on_152
" 153 color_153         153_on_white             white_on_153
"                       153_on_black             black_on_153
" 154 color_154         154_on_white             white_on_154
"                       154_on_black             black_on_154
" 155 color_155         155_on_white             white_on_155
"                       155_on_black             black_on_155
" 156 color_156         156_on_white             white_on_156
"                       156_on_black             black_on_156
" 157 color_157         157_on_white             white_on_157
"                       157_on_black             black_on_157
" 158 color_158         158_on_white             white_on_158
"                       158_on_black             black_on_158
" 159 color_159         159_on_white             white_on_159
"                       159_on_black             black_on_159
" 160 color_160         160_on_white             white_on_160
"                       160_on_black             black_on_160
" 161 color_161         161_on_white             white_on_161
"                       161_on_black             black_on_161
" 162 color_162         162_on_white             white_on_162
"                       162_on_black             black_on_162
" 163 color_163         163_on_white             white_on_163
"                       163_on_black             black_on_163
" 164 color_164         164_on_white             white_on_164
"                       164_on_black             black_on_164
" 165 color_165         165_on_white             white_on_165
"                       165_on_black             black_on_165
" 166 color_166         166_on_white             white_on_166
"                       166_on_black             black_on_166
" 167 color_167         167_on_white             white_on_167
"                       167_on_black             black_on_167
" 168 color_168         168_on_white             white_on_168
"                       168_on_black             black_on_168
" 169 color_169         169_on_white             white_on_169
"                       169_on_black             black_on_169
" 170 color_170         170_on_white             white_on_170
"                       170_on_black             black_on_170
" 171 color_171         171_on_white             white_on_171
"                       171_on_black             black_on_171
" 172 color_172         172_on_white             white_on_172
"                       172_on_black             black_on_172
" 173 color_173         173_on_white             white_on_173
"                       173_on_black             black_on_173
" 174 color_174         174_on_white             white_on_174
"                       174_on_black             black_on_174
" 175 color_175         175_on_white             white_on_175
"                       175_on_black             black_on_175
" 176 color_176         176_on_white             white_on_176
"                       176_on_black             black_on_176
" 177 color_177         177_on_white             white_on_177
"                       177_on_black             black_on_177
" 178 color_178         178_on_white             white_on_178
"                       178_on_black             black_on_178
" 179 color_179         179_on_white             white_on_179
"                       179_on_black             black_on_179
" 180 color_180         180_on_white             white_on_180
"                       180_on_black             black_on_180
" 181 color_181         181_on_white             white_on_181
"                       181_on_black             black_on_181
" 182 color_182         182_on_white             white_on_182
"                       182_on_black             black_on_182
" 183 color_183         183_on_white             white_on_183
"                       183_on_black             black_on_183
" 184 color_184         184_on_white             white_on_184
"                       184_on_black             black_on_184
" 185 color_185         185_on_white             white_on_185
"                       185_on_black             black_on_185
" 186 color_186         186_on_white             white_on_186
"                       186_on_black             black_on_186
" 187 color_187         187_on_white             white_on_187
"                       187_on_black             black_on_187
" 188 color_188         188_on_white             white_on_188
"                       188_on_black             black_on_188
" 189 color_189         189_on_white             white_on_189
"                       189_on_black             black_on_189
" 190 color_190         190_on_white             white_on_190
"                       190_on_black             black_on_190
" 191 color_191         191_on_white             white_on_191
"                       191_on_black             black_on_191
" 192 color_192         192_on_white             white_on_192
"                       192_on_black             black_on_192
" 193 color_193         193_on_white             white_on_193
"                       193_on_black             black_on_193
" 194 color_194         194_on_white             white_on_194
"                       194_on_black             black_on_194
" 195 color_195         195_on_white             white_on_195
"                       195_on_black             black_on_195
" 196 color_196         196_on_white             white_on_196
"                       196_on_black             black_on_196
" 197 color_197         197_on_white             white_on_197
"                       197_on_black             black_on_197
" 198 color_198         198_on_white             white_on_198
"                       198_on_black             black_on_198
" 199 color_199         199_on_white             white_on_199
"                       199_on_black             black_on_199
" 200 color_200         200_on_white             white_on_200
"                       200_on_black             black_on_200
" 201 color_201         201_on_white             white_on_201
"                       201_on_black             black_on_201
" 202 color_202         202_on_white             white_on_202
"                       202_on_black             black_on_202
" 203 color_203         203_on_white             white_on_203
"                       203_on_black             black_on_203
" 204 color_204         204_on_white             white_on_204
"                       204_on_black             black_on_204
" 205 color_205         205_on_white             white_on_205
"                       205_on_black             black_on_205
" 206 color_206         206_on_white             white_on_206
"                       206_on_black             black_on_206
" 207 color_207         207_on_white             white_on_207
"                       207_on_black             black_on_207
" 208 color_208         208_on_white             white_on_208
"                       208_on_black             black_on_208
" 209 color_209         209_on_white             white_on_209
"                       209_on_black             black_on_209
" 210 color_210         210_on_white             white_on_210
"                       210_on_black             black_on_210
" 211 color_211         211_on_white             white_on_211
"                       211_on_black             black_on_211
" 212 color_212         212_on_white             white_on_212
"                       212_on_black             black_on_212
" 213 color_213         213_on_white             white_on_213
"                       213_on_black             black_on_213
" 214 color_214         214_on_white             white_on_214
"                       214_on_black             black_on_214
" 215 color_215         215_on_white             white_on_215
"                       215_on_black             black_on_215
" 216 color_216         216_on_white             white_on_216
"                       216_on_black             black_on_216
" 217 color_217         217_on_white             white_on_217
"                       217_on_black             black_on_217
" 218 color_218         218_on_white             white_on_218
"                       218_on_black             black_on_218
" 219 color_219         219_on_white             white_on_219
"                       219_on_black             black_on_219
" 220 color_220         220_on_white             white_on_220
"                       220_on_black             black_on_220
" 221 color_221         221_on_white             white_on_221
"                       221_on_black             black_on_221
" 222 color_222         222_on_white             white_on_222
"                       222_on_black             black_on_222
" 223 color_223         223_on_white             white_on_223
"                       223_on_black             black_on_223
" 224 color_224         224_on_white             white_on_224
"                       224_on_black             black_on_224
" 225 color_225         225_on_white             white_on_225
"                       225_on_black             black_on_225
" 226 color_226         226_on_white             white_on_226
"                       226_on_black             black_on_226
" 227 color_227         227_on_white             white_on_227
"                       227_on_black             black_on_227
" 228 color_228         228_on_white             white_on_228
"                       228_on_black             black_on_228
" 229 color_229         229_on_white             white_on_229
"                       229_on_black             black_on_229
" 230 color_230         230_on_white             white_on_230
"                       230_on_black             black_on_230
" 231 color_231         231_on_white             white_on_231
"                       231_on_black             black_on_231
" 232 color_232         232_on_white             white_on_232
"                       232_on_black             black_on_232
" 233 color_233         233_on_white             white_on_233
"                       233_on_black             black_on_233
" 234 color_234         234_on_white             white_on_234
"                       234_on_black             black_on_234
" 235 color_235         235_on_white             white_on_235
"                       235_on_black             black_on_235
" 236 color_236         236_on_white             white_on_236
"                       236_on_black             black_on_236
" 237 color_237         237_on_white             white_on_237
"                       237_on_black             black_on_237
" 238 color_238         238_on_white             white_on_238
"                       238_on_black             black_on_238
" 239 color_239         239_on_white             white_on_239
"                       239_on_black             black_on_239
" 240 color_240         240_on_white             white_on_240
"                       240_on_black             black_on_240
" 241 color_241         241_on_white             white_on_241
"                       241_on_black             black_on_241
" 242 color_242         242_on_white             white_on_242
"                       242_on_black             black_on_242
" 243 color_243         243_on_white             white_on_243
"                       243_on_black             black_on_243
" 244 color_244         244_on_white             white_on_244
"                       244_on_black             black_on_244
" 245 color_245         245_on_white             white_on_245
"                       245_on_black             black_on_245
" 246 color_246         246_on_white             white_on_246
"                       246_on_black             black_on_246
" 247 color_247         247_on_white             white_on_247
"                       247_on_black             black_on_247
" 248 color_248         248_on_white             white_on_248
"                       248_on_black             black_on_248
" 249 color_249         249_on_white             white_on_249
"                       249_on_black             black_on_249
" 250 color_250         250_on_white             white_on_250
"                       250_on_black             black_on_250
" 251 color_251         251_on_white             white_on_251
"                       251_on_black             black_on_251
" 252 color_252         252_on_white             white_on_252
"                       252_on_black             black_on_252
" 253 color_253         253_on_white             white_on_253
"                       253_on_black             black_on_253
" 254 color_254         254_on_white             white_on_254
"                       254_on_black             black_on_254
" 255 color_255         255_on_white             white_on_255
"                       255_on_black             black_on_255

" Open this file in a window if it isn't edited yet.
" Use the current window if it's empty.
if expand('%:p') != expand('<sfile>:p')
  if &mod || line('$') != 1 || getline(1) != ''
    exe "new " . expand('<sfile>')
  else
    exe "edit " . expand('<sfile>')
  endif
endif

syn clear
8
while search("_on_", "W") < 540
  let col1 = substitute(expand("<cword>"), '\(\S\+\)_on_\S\+', '\1', "")
  let col2 = substitute(expand("<cword>"), '\S\+_on_\(\S\+\)', '\1', "")
  exec 'hi col_'.col1.'_'.col2.' ctermfg='.col1.' guifg='.col1.' ctermbg='.col2.' guibg='.col2
  exec 'syn keyword col_'.col1.'_'.col2.' '.col1.'_on_'.col2
endwhile
8,539g/^"......\S/call search('^"......','e')|let w=expand("<cword>")|let c=substitute(w,'color_', '', '')|exec 'hi col_'.w.' ctermfg='.c| exec 'syn keyword col_'.w." ".w
nohlsearch
