   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Arial                          :  #   winspool  HP DeskJet 610C eLPT1: 40 PS  IP_192.168      HP DeskJet 610C entre 440 PS     � XC�  �4d   ,  ,   A4                                                                              DINU"   4$ ��H                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             $   �$               $   �$                                                                                                               �  5XRX             >@   ��� D r a f t                                                                                                                                                                                                                                                          9999                                                    00            222222                                                                               �DRIVER=winspool
DEVICE=HP DeskJet 610C
OUTPUT=LPT1:
ORIENTATION=1
PAPERSIZE=5
ASCII=5
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=300
COLOR=2
YRESOLUTION=300
TTOPTION=2
COLLATE=0
         "@I"                           Arial                          4"Sindicato dos Empregados de Edificios de S�o Paulo"            !"P�gina " + ALLTRIM(STR(_PAGENO))                               Arial                          "@I"                           Arial                          "Nome do Candidato"            Alltrim(atendvag.soc)                                         Arial                          Alltrim(atendvag.cond)                                        Arial                          "@I"                           Arial                          "Nome da Adm/Cond"             "@I"                           Arial                          "Observa��o"                   Arial                          8"Relat�rio de Atendimento ao Trabalhador - Depto. Vagas"        
_pagetotal                                                    Arial                          Arial                          ""Total de Atendendimento no M�s: "                              mes_ttt                                                       Arial                          atendvag.fone                                                 Arial                          atendvag.obs                                                  Arial                          "@I"                           Arial                          
"Telefone"                     "@I"                           Arial                          "Cursos"                       "@I"                           Arial                          "Socios"                       atendvag.cursos                                               Arial                          ,IIF((atendvag.cod<>0), 'S', atendvag.cursos)                                                   Arial                          "@I"                           Arial                          "Vagas"                        atendvag.vagas                                                Arial                          "@I"                           Arial                          
"Aprovado"                     )IIF((atendvag.aprovado='S'), ' Sim', ' ')                                                      Arial                          Arial                          "Total de Atendimento Socios: "                                 Arial                          #"Total de Atendimento N�o Socios: "                             Arial                          "Total de Atend. Aprovados"                                     	Total_soc                                                     Arial                          
Total_nsoc                                                    Arial                          
Total_apro                                                    Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          dataenvironment                _Top = 289
Left = 1
Width = 520
Height = 205
DataSource = .NULL.
Name = "Dataenvironment"
                                   cursor                         ~Top = 20
Left = 150
Height = 90
Width = 90
Alias = "atendvag"
CursorSource = f:\arquivos\atendvag.dbf
Name = "Cursor2"
                               