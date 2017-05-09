%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SIST Template
%% copyright (c) Guanjie Wang, <wangguanjie0@126.com>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2008/12/01]
\ProvidesClass{sistthesis}[2016/11/16 v1.0 SIST G. Wang]



% 设置学位级别(博士后、博士、硕士)
\newif\ifsist@postdoc \sist@postdocfalse
\newif\ifsist@doctor \sist@doctorfalse
\newif\ifsist@master \sist@masterfalse
\newif\ifsist@thesis \sist@thesisfalse

\DeclareOption{postdoc}{\sist@postdoctrue}
\DeclareOption{doctor}{\sist@doctortrue}
\DeclareOption{master}{\sist@mastertrue}
%将选项传给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

% terminates the option processing 结束option进程
\ProcessOptions\relax

\LoadClass[a4paper,zihao=-4]{ctexbook}

\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{graphicx,color,CJKfntef,geometry,fancyhdr}


\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,citecolor={blue}}

\geometry{footskip=6mm,headsep=5mm,headheight=5mm,left=35mm,right=20mm,top=30mm,bottom=29mm}


\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}%
	\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% define classification etc. 定义分类号等
\newcommand{\classification}[1]{\def\value@classification{#1}}
\newcommand{\confidential}[1]{\def\value@confidential{#1}}
\newcommand{\UDC}[1]{\def\value@UDC{#1}} 
\newcommand{\IDnumber}[1]{\def\value@IDnumber{#1}}

\ifsist@master
\sist@thesistrue
\def\cndegree{硕\quad 士}
\def\endegree{Master of Science}
\fi

\ifsist@doctor
\sist@thesistrue
\def\cndegree{博\quad 士}
\def\endegree{Doctor of Philosophy}
\fi


% define title and author   定义中英文title和author
\renewcommand{\title}[1]{\def\value@cntitle{#1}}
\newcommand{\englishtitle}[1]{\def\value@entitle{#1}}
\newcommand{\setitle}[1]{\def\value@smallentitlea{#1}}
\newcommand{\setitlee}[1]{\def\value@smallentitleb{#1}}
% 作者
\renewcommand{\author}[1]{\def\value@cnauthor{#1}}
\newcommand{\englishauthor}[1]{\def\value@enauthor{#1}}

% 指导教师
\newcommand{\advisor}[1]{\def\value@cnadvisor{#1}}
\newcommand{\englishadvisor}[1]{\def\value@enadvisor{#1}}

\newcommand{\research}[1]{\def\value@cnresearch{#1}}
\newcommand{\englishresearch}[1]{\def\value@enresearch{#1}}

\newcommand{\submitdate}[1]{\def\value@cnsubmitdate{#1}}
\newcommand{\englishsubmitdate}[1]{\def\value@ensubmitdate{#1}}
% define time
\newcommand{\jobbegin}[1]{\def\POST@value@jobbegin{#1}}
\newcommand{\jobend}[1]{\def\POST@value@jobend{#1}}
\newcommand{\reportfinish}[1]{\def\POST@value@reprortfinish{#1}}
\newcommand{\reportsubmit}[1]{\def\value@submitdate{#1}}

% major 二级学科
\newcommand{\major}[1]{\def\value@cnmajor{#1}}
\newcommand{\englishmajor}[1]{\def\value@enmajor{#1}}

% discipline 一级学科
\newcommand{\discipline}[1]{\def\value@cndiscipline{#1}}
\newcommand{\englishdiscipline}[1]{\def\value@endiscipline{#1}}

% 学院
\newcommand{\school}[1]{\def\value@cnschool{#1}}
\newcommand{\englishschool}[1]{\def\value@enschool{#1}}


% 两端对齐
%\newlength{\SIST@title@width}
%\newcommand{\SIST@put@title}[2][\SIST@title@width]{%
%	\begin{CJKfilltwosides}{#1}#2\end{CJKfilltwosides}}


% 定义下划线的长度级线上内容
\def\SIST@underline[#1]#2{%
	\underline{\hbox to #1{\hfill#2\hfill}}}
\def\SISTunderline{\@ifnextchar[\SIST@underline\underline}



% 博士后
\ifsist@postdoc
	% redefine \maketitle
	\renewcommand{\maketitle}{
		\cleardoublepage
		\thispagestyle{empty}
		\begin{center}
			{\songti\zihao{-5} 分类号:~\SISTunderline[100pt]{\value@classification}\hfill 密级:~\SISTunderline[88pt]{\value@confidential}}\\
			\vspace{0.7cm}
			{\songti\zihao{-5}
			U~D~C:~\SISTunderline[100pt]{\value@UDC} \hfill 编号:~\SISTunderline[88pt]{\value@IDnumber} }\\
			\vspace{3cm}
			{\bfseries\heiti\zihao{2} 上~海~科~技~大~学\\\vspace{2.5ex}博~士~后~研~究~工~作~报~告}\\ 
			\vspace{2.5cm}
			{\bfseries\heiti\zihao{3} \value@cntitle}\\
			\vspace{1.5cm}
			{\bfseries\heiti\zihao{-3} {~\value@cnauthor~}\\}
			{\songti\zihao{-3}
			\vspace{2cm}
			工作完成日期：\SISTunderline[180pt]{~\POST@value@reprortfinish~}\\
			\vspace{10pt}
			报告提交日期：\SISTunderline[180pt]{~\value@cnsubmitdate~}\\
			\vfill
			上海科技大学（上海）\\
			\vspace{20pt}
			\value@cnsubmitdate
		}
		\end{center}
		}


	\newcommand\makeenglishtitle{%
		\cleardoublepage
		\thispagestyle{empty}
		\vspace*{50pt}   
		\begin{center}
			{\bfseries\heiti\zihao{-2} \value@cntitle}
			\vskip 40pt
			{\linespread{1.2}\selectfont
				\sf \zihao{2} \value@entitle\\}
			\vspace{80pt}
			{\songti\zihao{-3}
				\begin{tabular}{rl}
				\begin{CJKfilltwosides}{11em}博士后姓名\end{CJKfilltwosides}:&\SISTunderline[180pt]{\value@cnauthor}\\ [3mm]
				\begin{CJKfilltwosides}{11em}流动站(一级学科)名称\end{CJKfilltwosides}:&\SISTunderline[180pt]{\value@discipline}\\ [3mm]
				\begin{CJKfilltwosides}{11em}专\hspace{1em}业(二级学科)名称\end{CJKfilltwosides}:&\SISTunderline[180pt]{\value@cnmajor}\\
			\end{tabular}\\
			\vspace{80pt}
		\begin{tabular}{rl}
			\begin{CJKfilltwosides}{11em}研究工作起始时间\end{CJKfilltwosides}:&\SISTunderline[180pt]{\POST@value@jobbegin}\\ [3mm]
			\begin{CJKfilltwosides}{11em}研究工作期满时间\end{CJKfilltwosides}:&\SISTunderline[180pt]{\POST@value@jobend}\\
		\end{tabular}
				%单位名称:\SISTunderline[200pt]{上海科技大学}\\
				%报告提交日期:\SISTunderline[200pt]{2013年}\\
				\vfill
				上海科技大学信息学院（上海）\\
				\vspace{20pt}
				\value@cnsubmitdate
				}
		\end{center}
	}
\fi



\ifsist@thesis
\renewcommand{\maketitle}{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		{\songti\zihao{-5} 分类号:~\SISTunderline[100pt]{\value@classification}\hfill 密级:~\SISTunderline[88pt]{\value@confidential}}\\
		\vspace{0.7cm}
		{\songti\zihao{-5}
			U~D~C:~\SISTunderline[100pt]{\value@UDC} \hfill 学号:~\SISTunderline[88pt]{\value@IDnumber} }\\
		\vspace{2cm}
		{\bfseries\heiti\zihao{2} 上~海~科~技~大~学\\\vspace{2.5ex}\cndegree\quad 学 \quad 位 \quad 论\quad 文}\\ 
		\vspace{1cm}
			\begin{figure}[h]
				\begin{center}
					\includegraphics[width=3cm]{logo.jpg}
				\end{center}
			\end{figure}
		\vspace{1cm}
		{\heiti\zihao{4}
			\begin{tabular}{rl}
				\begin{CJKfilltwosides}{7em}中文论文题目：\end{CJKfilltwosides}&\SISTunderline[300pt]{\value@cntitle}\\ [2mm]
				\begin{CJKfilltwosides}{7em}英文论文题目：\end{CJKfilltwosides}&\SISTunderline[300pt]{\value@smallentitlea}\\ [2mm]
				\begin{CJKfilltwosides}{7em}\end{CJKfilltwosides}&\SISTunderline[300pt]{\value@smallentitleb}\\ [2mm]
			\end{tabular}
			}\\
			\vspace{1cm}
			{\heiti\zihao{4}
			\begin{tabular}{rl}
			\begin{CJKfilltwosides}{6em}作者姓名：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnauthor}\\ [3mm]
			\begin{CJKfilltwosides}{6em}指导教师：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnadvisor}\\ [3mm]
			\begin{CJKfilltwosides}{6em}研究方向：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnresearch}\\ [3mm]
			\begin{CJKfilltwosides}{6em}学科(专业)：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnmajor}\\ [3mm]
			\begin{CJKfilltwosides}{6em}所在学院：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnschool}\\ [3mm]
			\begin{CJKfilltwosides}{6em}提交日期：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnsubmitdate}\\ [3mm]
			\end{tabular}
		}
	\end{center}
}


\newcommand\makeenglishtitle{%
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{50pt}   
	\begin{center}
		{\linespread{1.2}\selectfont
		\sf \zihao{-1} \value@entitle\\}
		\vspace{1cm}
		\vskip \stretch{1}
		\begin{figure}[h]
			\begin{center}
				\includegraphics[width=3cm]{logo.jpg}
			\end{center}
		\end{figure}
		\vspace{1.5cm}
		{\bfseries \zihao{-2}\value@enauthor}\\
		\vspace{0.5cm}
		{\normalfont \zihao{-3} \value@enschool}\\
		\vspace{2.5ex}
		{\normalfont \zihao{-3} ShanghaiTech University}\\
		\vspace{3.5cm}
		{\it\normalsize \zihao{-4} A thesis submitted for the degree of\\
			\endegree}\\
		\vfill
		\value@ensubmitdate
	\end{center}
}
\fi

%设置页眉页脚
\fancypagestyle{plain}{%
	\fancyhf{}%
	\renewcommand{\headrulewidth}{0pt}%
	\renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE]{\small \rightmark}
\fancyhead[LO]{\small \leftmark}
\fancyhead[LE,RO]{\small ~\thepage~}


% 设置章节目录等格式
\ctexset{%
	chapter/name={第,章},
	chapter/number=\arabic{chapter},
	chapter/format = {\centering\bfseries\heiti\zihao{3}},
	section/format = {\bfseries\heiti\zihao{-3}},
	subsection/format = {\bfseries\heiti\zihao{4}},
	subsubsection/format = {\bfseries\heiti\zihao{-4}},
	appendixname=附录,
	contentsname={目\hspace{\ccwd}录},
	listfigurename=插图,
	listtablename=表格,
	figurename=图,
	tablename=表,
	bibname=参考文献,
	indexname=索引,
}

% 设置frontmatter区域内容



% 声明
\newenvironment{announce}
{\Nchapter{}}
{}
% 中英文摘要
\newenvironment{abstract}
{\Nchapter{摘\quad 要}}
{}
\newcommand\keywords[1]{%
	\vspace{2ex}\noindent{\heiti 关键词:} #1}
\newenvironment{englishabstract}
{\Nchapter{Abstract}}
{}
\newcommand\englishkeywords[1]{%
	\vspace{2ex}\noindent{\bfseries Keywords:~} #1}

\renewcommand\tableofcontents{%
	\if@twocolumn
	\@restonecoltrue\onecolumn
	\else
	\@restonecolfalse
	\fi
	\Nchapter{\contentsname}%
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
}
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newcommand\Nchapter[1]{%
	\if@mainmatter%
	\@mainmatterfalse%
	\chapter{#1}%
	\@mainmattertrue%
	\else
	\chapter{#1}%
	\fi}

%参考文献
\newenvironment{publications}[1]
{\Nchapter{发表文章}%
	\@mkboth{\MakeUppercase 发表文章}
	{\MakeUppercase 发表文章}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `publications' environment}}%
	\endlist}

\newenvironment{resume}
{\Nchapter{简\quad 历}}
{}
\newenvironment{resumesection}[1]
{{\noindent\normalfont\bfseries #1}
	\list{}{\labelwidth\z@
		\leftmargin 2\ccwd}
	\item\relax}
{\endlist}
\newenvironment{resumelist}[1]
{{\noindent\normalfont\bfseries #1}
	\list{}{\labelwidth\z@
		\leftmargin 4\ccwd
		\itemindent -2\ccwd
		\listparindent\itemindent}
	\item\relax}
{\endlist}

\renewenvironment{thanks}
{\Nchapter{致\quad 谢}}
{}
\setcounter{secnumdepth}{4}
% 定义默认值
\makeatletter

\def\value@classification{分类号}
\def\value@confidential{}
\def\value@UDC{UDC} 
\def\value@IDnumber{编号}



\def\value@cntitle{~~~~~（论~文~题~目）~~~~~}
\def\value@entitle{~~~~~(English title)~~~}
\def\value@smallentitlea{~~~~~(English title 1)~~~}
\def\value@smallentitleb{~~~~~(English title 2)~~~}

\def\value@cnauthor{~~~~~（作~者~姓~名）~~~~~}
\def\value@enauthor{~~~~~(author's name)~~~~~}

\def\value@cnadvisor{指导教师}
\def\value@enadvisor{advisor}

\def\value@cnresearch{研究方向}
\def\value@enresarch{research}


\def\value@cnmajor{计算数学}
\def\value@enmajor{major}

\def\value@discipline{电子科学与技术}
\def\value@endiscipline{discipline}

\def\value@cnschool{信息科学与技术学院}
\def\value@enschool{School of Inforamtion Science and Technology}

\def\value@cnsubmitdate{二零一七年七月}
\def\value@ensubmitdate{
\ifcase\month\or
January\or February\or March\or April\or May\or June\or
July\or August\or September\or October\or November\or December\fi
, \number\year}


\def\POST@value@jobbegin{2015年7月22日}
\def\POST@value@jobend{2015年7月22日}
\def\POST@value@reprortfinish{2010年7月--2013年7月}
\makeatother

\endinput
