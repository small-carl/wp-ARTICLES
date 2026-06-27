
![弗朗西斯科·法·迪·布鲁诺神父. 约 1860. wikimedia.](https://files.mdnice.com/user/112960/9a880c8a-bbaa-41d3-8ebe-c5b47a1d20de.png)

<!-- 【完成度】整体约 55%，状态：未完成稿。前半（一元公式、贝尔多项式、示例、组合划分形式、分式求导应用）基本成形；三处主要空缺待补：(1) 分式求导推导中断后转英文 composita 段需补全并译为中文；(2) “n 为正有理数”小节公式为空 $$$$；(3) “与霍普夫代数的联系”整节空白。另需厘清 B_n 与 B_{n,k} 记号、统一公式定界符与中英文。下一步建议优先补全三处空缺并校对贝尔多项式记号。 -->


微积分对于初学者来说充满了美与暴力。经典无穷小邻域下定义的连续性往往无视了集合们的感受，抚摩着它们的头发与尾巴毛；但充满递归与对称之满足感的运算往往让我们麻木或而沉浸其中。从前，集合们的叫被以哥德尔为首的德国学域的嘶吼所暂时淹没，而那之后的抽象之寂静让人不时想起19世纪那场暴风雨的味道。

* 一元复合函数的$n$阶导数公式 （Cav. F. Faa di Bruno, 1853）

$${\displaystyle {d^{n} \over dx^{n}}f(g(x))=\sum _{k=0}^{n}f^{(k)}(g(x))\cdot B_{n,k}\left(g'(x),g''(x),\dots ,g^{(n-k+1)}(x)\right).}$$


$B_{n,k}$ 为贝尔指数多项式，即

<!-- 【核对】下一行公式符号不自洽：左边 B=B_n(m_1,...,m_n) 用 m_i，右边连乘用 x_i；且 \sum_{k=1}^n B_{n,k} 实为完全贝尔多项式 B_n，与主公式所用的部分贝尔多项式 B_{n,k} 不是同一对象。请统一变量记号，并明确区分 B_n（完全）与 B_{n,k}（部分）。 -->
  $${\displaystyle {\begin{aligned}B=B_{n}(m_{1},\dots ,m_{n})&=\sum _{k=1}^{n} B_{n,k}(m_{1},m_{2},\dots ,m_{n-k+1})\\&=n!\sum _{1j_{1}+\ldots +nj_{n}=n}\prod _{i=1}^{n}{\frac {x_{i}^{j_{i}}}{(i!)^{j_{i}}j_{i}!}}\end{aligned}}}$$
    
  $n,k,j\,$满足条件$\,[1]$,$\,[2]$：
    $$[1] {\displaystyle\quad j_{1}+j_{2}+\cdots +j_{n-k+1}=k,}$$
    $$[2]{\displaystyle\quad j_{1}+2j_{2}+\cdots +(n-k+1)j_{n-k+1}=n.}$$

##### [示例]
  假设 $n=4$ , $k=1,2,3,4$
  
  $\,[1]$: 
  $$\begin{align*}
  k=1&=0+0+0+1=(j_4)\\
  k=2&=1+0+1\\
  k=3&=2+1\\
  k=4&=4
  \end{align*}$$
  
  $\,[2]$: 
  $$\begin{align*}
    n&=4j_4=4\\
    &=j_1+3j_3=1+3=4\\
    &=j_1+2j_2=2+2=4\\
    &=j_1=4
  \end{align*}$$
  
其它示例如下：

<!-- 【结构】下方 D^1..D^4 展开采用 g^{(i)}/i! 归一化并整体除以 n!（EGF 约定），与上文标准 Faà di Bruno 形式不同。建议加一句说明此为指数生成函数归一化写法，并解释蓝色标记的“平凡划分”含义，便于读者对应。 -->

$$
{\displaystyle {\begin{aligned}&{\frac {D^{1}(f\circ {}g)}{1!}}&=\left(f^{(1)}\circ {}g\right)\textcolor{blue}{\frac {\frac {g^{(1)}}{1!}}{1!}}\\[8pt]
&{\frac {D^{2}(f\circ g)}{2!}}&=\left(f^{(1)}\circ {}g\right){\frac {\frac {g^{(2)}}{2!}}{1!}}&{}+
\left(f^{(2)}\circ {}g\right)\textcolor{blue}{\frac {{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}}{2!}}\\[8pt]
&{\frac {D^{3}(f\circ g)}{3!}}&=\left(f^{(1)}\circ {}g\right){\frac {\frac {g^{(3)}}{3!}}{1!}}&{}+
\left(f^{(2)}\circ {}g\right)\textcolor{blue}{\frac {\frac {g^{(1)}}{1!}}{1!}}{\frac {\frac {g^{(2)}}{2!}}{1!}}&{}+
\left(f^{(3)}\circ {}g\right)\textcolor{blue}{\frac {{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}}{3!}}\\[8pt]
&{\frac {D^{4}(f\circ g)}{4!}}&=\left(f^{(1)}\circ {}g\right){\frac {\frac {g^{(4)}}{4!}}{1!}}&{}+
\left(f^{(2)}\circ {}g\right)\left(\textcolor{blue}{\frac {\frac {g^{(1)}}{1!}}{1!}}{\frac {\frac {g^{(3)}}{3!}}{1!}}+{\frac {{\frac {g^{(2)}}{2!}}{\frac {g^{(2)}}{2!}}}{2!}}\right)&{}+
\left(f^{(3)}\circ {}g\right)\textcolor{blue}{\frac {{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}}{2!}}{\frac {\frac {g^{(2)}}{2!}}{1!}}&{}+
\left(f^{(4)}\circ {}g\right)\textcolor{blue}{\frac {{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}{\frac {g^{(1)}}{1!}}}{4!}}\end{aligned}}}
$$
其中各运算为一的“平凡”划分数都已被标记蓝色。如果某系统存在一个函数 $g$ 使得这样的项全被约掉或整合，那该系统很有可能适用不动点解析。可见$\,g\,$作为括号里头被复合的函数直接被导炸了。


这里涉及到了组合数的概念。因此，布鲁诺的公式可以简化为如下式子：
$${\displaystyle {D^n}f(g(x))=(f\circ g)^{(n)}(x)=\sum _{\pi \in \Pi }f^{(\left|\pi \right|)}(g(x))\cdot \prod _{B\in \pi }g^{(\left|B\right|)}(x)}$$

* 定义

    组合 $\pi = \{m_1, m_2, \cdots,m_n\}$ 遍历集合 $\Pi$ 的元素。其中 $\Pi := \mathcal{Partition}{\left(\{1,\cdots ,n\}\right)}$
    $= \{\{1\},\{2,\cdots,n\}\},\cdots,\{\{1,\cdots ,n\}\}$ 包含了正整数 $n$ 的所有正整数大小($1\leq |\pi|\leq n$)的划分。
    
    

该公式最直接的应用莫过于计算分式型函数$\frac{f(x)}{g(x)}$的 $n\,$阶导数:

$$\frac{d^n}{dx^n}\left(\frac{f(x)}{g(x)}\right)=D^n\left(\frac{f}{g}\right)=\sum_{i=1}^{n}\binom{n}{i}f^{(i)}\left(\frac{1}{g}\right)^{(n-i)}$$

带入$\,\frac{1}{g}={g(x)}^{-1}=r(g(x))\,$后化简，我们不易得到：

<!-- 【待补全】推导在此戛然而止：“我们不易得到：”后未给出化简结果。请补上把 (1/g)^{(n-i)} 用 Faà di Bruno 展开、并整理成 composita 形式的关键步骤；否则与下文英文 composita 定义无法衔接。 -->


The $\textbf{composita}$ of a given generating function $F(x)$ is:

<!-- 【续写建议】本段从中文骤转英文，且用 \[ \] 定界（公众号常不渲染）。建议：①译为中文；②改用本文统一的 $$ 公式环境；③补一句承接前文分式求导，说明为何此处引入 composita（生成函数复合的系数）。 -->
    \[
    F^{\Delta}(n,k) = \sum_{\pi_{k}\in C_n}f(\lambda_1)f(\lambda_2)...f(\lambda_k)
    \]
.  $C_{n}$ the set of all compositions of an integer $n$, $\pi_k $  the composition of integer $n$ into $k$ parts, such that parts meet the condition $\sum_{i=1}^k\lambda_i=n$
This is actually a binary partition of power integer $n$. We can seperate the coefficient and variable completely.






### 推广
---
1. 当 $f,g$ 为多元函数.

<!-- 【待补全】多元推广仅给出 A_{k,i} 与 j 的定义即转“证明见 [^1]”。请补出多元情形 Faà di Bruno 公式的主体表达式（对多重指标求和的形式），否则读者无法据此理解结论。 -->
$$A_{k,i}=\{p_1,\cdots,p_i\},\,p_i\in\Omega\setminus{\{\emptyset\}}$$

$$j=\mathscr{card}_{|x_i|=i}(A_{k,i})$$

证明见 [^1]

2. 当 $n$ 为正有理数.

<!-- 【待补全】此处公式为空 $$$$。请补写 n 为正有理数（分数阶导数，如 Riemann–Liouville / Caputo 框架）情形下 Faà di Bruno 公式的推广形式与适用条件，并给出参考文献或简要推导。 -->
$$$$



###  与霍普夫代数的联系 -- Link to Hopf algebra

<!-- 【待补全】本节仅有标题，正文全空。建议补写：Faà di Bruno Hopf 代数的定义（以贝尔多项式/合成为余积）、与复合函数群的对偶、合成余积公式，以及它如何统一解释前文的组合划分结构。可引用 Brouder–Frabetti–Krattenthaler 等文献。 -->
---

#### Dates and references ####
  [^1]:cited.
> Encinas, L., & Masqué, J. (2003). A short proof of the generalized Faà di bruno’s formula. Applied Mathematics Letters, 16(6), 975–979. [https://doi.org/10.1016/s0893-9659(03)90026-7](https://doi.org/10.1016/s0893-9659(03)90026-7)

>Faà di Bruno, C. F.. “Note sur un nouvelle formule de calcul différentiel.” Quart. J. Math. 1 (1857): <u>359-360.</u> [https://www.mn.uio.no/math/english/people/aca/michaelf/translations/faadibruno_english.pdf](https://www.mn.uio.no/math/english/people/aca/michaelf/translations/faadibruno_english.pdf)

>Johnson, Warren. (2002). The Curious History of Faa di Bruno's Formula. American Mathematical Monthly. 109. 217-234. 10.2307/2695352. [https://www.researchgate.net/publication/230873028_The_Curious_History_of_Faa_di_Bruno's_Formula](https://www.researchgate.net/publication/230873028_The_Curious_History_of_Faa_di_Bruno's_Formula) 

>> Wikipedia contributors. (2025, April 20). Faà di Bruno's formula. In Wikipedia, The Free Encyclopedia. <u>Retrieved 16:00, June 12, 2025.</u> [https://en.wikipedia.org/w/index.php?title=Fa%C3%A0_di_Bruno%27s_formula&oldid=1286472383](https://en.wikipedia.org/w/index.php?title=Fa%C3%A0_di_Bruno%27s_formula&oldid=1286472383)

