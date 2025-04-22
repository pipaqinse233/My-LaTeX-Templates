% qmes-template.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qmes-template}[2025/04/16 QMES Template]

\LoadClass[12pt,a4paper]{article}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{datetime}
\RequirePackage{titling}
\RequirePackage{etoolbox}
\RequirePackage{array}
\RequirePackage{lastpage}
\RequirePackage{geometry}  
\RequirePackage{shellesc}
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}

\geometry{a4paper,left=25mm,right=20mm,top=25mm,bottom=25mm}

% 用户可定义的字段
\newcommand{\@course}{}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\studentlist}{}
\newcommand{\addstudent}[2]{\listadd{\studentlist}{{#1}{#2}}}

% 设置Times New Roman字体
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}

% 页眉页脚设置
\setlength{\headheight}{15pt}
\setlength{\headsep}{10pt}
\setlength{\footskip}{15pt}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\fancyhead[L]{\footnotesize QMUL Engineering School, NPU}
\fancyhead[R]{\footnotesize \@course}
\fancyfoot[R]{\thepage{} of \pageref{LastPage}}
\fancypagestyle{plain}{\pagestyle{fancy}}

\setlength{\voffset}{-10mm}                        
\setlength{\topmargin}{0mm}
\setlength{\headheight}{5mm}
\setlength{\headsep}{5mm}
\setlength{\footskip}{10mm}

% 学生信息处理宏
\newcommand{\@processstudent}[1]{\@studentrow#1}
\def\@studentrow#1#2{#1 & #2 \\}

% 封面页设置
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{center}
        \vspace*{2cm}
        \includegraphics[width=0.3\textwidth]{./figure/LOGO.jpg}
        \vspace{2cm}
        
        {\LARGE \bfseries \@title \par}
        \vspace{2cm}
        
        \begin{minipage}{0.8\textwidth}
            \linespread{1.5}\selectfont
            \centering
            \begin{tabular}{@{}>{\raggedleft}p{0.45\textwidth}p{0.45\textwidth}@{}}
                \forlistloop{\@processstudent}{\studentlist}
            \end{tabular}
        \end{minipage}
        
        \vfill
        Word Count: \\
        \@date \\
        Course: \@course \\
    \end{center}
    \newpage
    \pagestyle{fancy}
    \setcounter{page}{1}
}

% 目录页设置保持不变
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
    \pagestyle{empty}
    \oldtableofcontents
    \newpage
    \pagestyle{fancy}
}