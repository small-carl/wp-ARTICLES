# Fractal Geometry — Lecture Notes

<!-- 【完成度】本文约 62% 完成（unfinished）。主体文字基本齐全，多数 N,r,D 自洽，但存在三类待办：(1) 小节编号严重错乱——正文 ③④⑦⑤，Page2 又 ①②③，且 ③⑦ 各重复两次，①②③ 反而靠后，疑缺前置小节；(2) 多处截断/占位句（②Note 开头缺字、①公式下标错乱、⑤『dμ supported on S』空洞公式、Remark 戛然而止）；(3) 命名/笔误（Kakeya↔角谷↔Kakutani、Piano→Peano、Wiener–Lairy→Wiener–Lévy、monkey tree↔T-square）。下一步：先统一编号与目录，再逐条补全截断处，最后做术语校对。 -->

---

## ③ The Universe as a Fractal

<!-- 【结构】全文编号错乱：此处为 ③，其后为 ④⑦⑤，Page2 再出现 ①②③；③ 与 ⑦ 各出现两次。①②③ 这类小号反而排在文末，强烈暗示原讲义开头有未录入的小节（建议补：①分形/分形维数定义 ②自相似与 Moran 方程引入）。请改用连续编号 1,2,3… 或重排，并补一个目录。 -->

**Motivating construction.** Construct a fractal satisfying $M(R) \propto R^D$, where $M(R)$ is the
mass (or number of neighbours) enclosed in a sphere of radius $R$ and $D$ is the fractal dimension.
This scaling law was first proposed by **Fournier d'Albe** (*Two New Worlds*, 1907) and later
elaborated in a hierarchical-universe model by **Charlier** (1908, 1922).

**Connection to Olbers' paradox.** Charlier's hierarchical (fractal) distribution of matter was
proposed as a mechanism for resolving **Olbers' paradox** — the cosmological puzzle, also associated
with Gauss, asking why the night sky is dark if the universe contains infinitely many stars. In a
homogeneous infinite universe every line of sight terminates on a stellar surface, predicting a
uniformly bright sky. A fractal universe with $D < 3$ has sufficiently sparse matter at large scales
that the total integrated luminosity converges, leaving dark gaps between the stars. Charlier's model
was the first to provide a correct mathematical demonstration of this resolution.

> **Note on the correct condition.** For $M(R) \propto R^D$, the number of galaxies within radius
> $R$ scales as $R^D$. The homogeneous case has $D = 3$; any value $D < 3$ signals fractal (sub-
> volume) distribution. Present-day surveys (SDSS) suggest a transition to homogeneity at $\sim 100$
> Mpc, with a fractal-like clustering regime at smaller scales.

---

## ④ Self-Similar Maps and the Möbius Group

**Self-similar rescaling** gives rise to $\mu$-atoms and $\mu$-molecules (the hyperbolic components
and their boundary atoms in the Mandelbrot set), as well as **Poincaré chains** (sequences of
tangent or intersecting limit-cycle circles) and **self-avoiding** paths in fractal geometry.

The **self-similarity group** (also called the **automorphism group** or **fractal linear
transformation group**) is precisely the group of **Möbius transformations** (also known as linear
fractional transformations or homographic transformations):

$$z \;\longmapsto\; \frac{az + b}{cz + d}, \qquad a,b,c,d \in \mathbb{C},\quad ad - bc = 1.$$

The normalisation $ad - bc = 1$ identifies this group with $\mathrm{PSL}(2,\mathbb{C})$. Möbius
transformations are the biholomorphic self-maps of the Riemann sphere and are conformal (angle-
preserving). Discrete subgroups of the Möbius group are **Kleinian groups**; their **limit sets**
are typically fractal dust or fractal curves, forming the setting for the "Indra's Pearls" family of
fractals.

**Limit set / "corona" set** $\mathcal{L}$: the complement of the Fatou set, i.e., the fractal
boundary set on which the dynamics is chaotic.

---

### 1. Kernel of the Real Axis — Myrberg (1962)

Consider the quadratic family $f_c(z) = z^2 + c$ restricted to the real axis. **P. J. Myrberg**
(*J. Math. Pures Appl.*, 1962) identified the limit of the period-doubling cascade as
$c^* \approx -1.40115\ldots$, now called the **Myrberg–Feigenbaum point**. (The value was
rediscovered independently by Feigenbaum in 1978.)

A parameter $c$ lies in the Mandelbrot set if and only if the orbit of the critical point $z = 0$
under $f_c$ remains bounded. Equivalently:

> The iterate $f_c^n(z)$ converges to $\infty$, **or** $c$ lies in a hyperbolic component
> $\omega$ such that the critical point is attracted to a periodic orbit. Specifically, when $c$
> belongs to a period-$q$ component (a "mu-atom"), there exists a super-attracting orbit for which
$$\left|\bigl(f_c^q\bigr)'(c_\omega)\right| < 1.$$

Here $c_\omega$ denotes the centre of a hyperbolic component, and the condition $|(f_c^q)'| < 1$
means the periodic orbit is attracting.

---

### 2. Decomposable Dynamical Systems — Mandelbrot (1980)

Mandelbrot (1980) introduced the visualisation of the parameter space of $f_c(z) = z^2 + c$ and
demonstrated that the boundary of the Mandelbrot set separates "decomposable" (structurally stable)
dynamics from chaotic dynamics. The complement of the Mandelbrot set corresponds to parameters for
which the Julia set is a **Cantor set** (totally disconnected "dust"), while points inside
correspond to connected Julia sets.

---

## ⑦ Random Peano Curve (Space-Filling Curve)

$$N = 4, \quad r = \tfrac{1}{2}, \quad D = \frac{\log N}{\log(1/r)} = \frac{\log 4}{\log 2} = 2.$$

A **Peano curve** (or space-filling curve) maps $[0,1]$ surjectively onto $[0,1]^2$; the fractal
dimension of the image equals 2, filling the plane. The "random" variant here refers to a
randomised construction with the same parameters.

$
\begin{tikzpicture}[scale=2.0]
% 2x2 grid (level-1 Hilbert/Peano-type curve)
\draw[gray!40, step=0.5] (0,0) grid (1,1);
% Peano path through 4 cells in a U-shape (N=4 copies, r=1/2)
\draw[thick, ->]
  (0.25, 0.25) -- (0.25, 0.75) -- (0.75, 0.75) -- (0.75, 0.25);
% Sub-squares filled to hint at self-similarity
\fill[gray!15] (0,0.5) rectangle (0.5,1);
\fill[gray!15] (0.5,0.5) rectangle (1,1);
\fill[gray!15] (0,0) rectangle (0.5,0.5);
\fill[gray!15] (0.5,0) rectangle (1,0.5);
\draw[gray!40, step=0.5] (0,0) grid (1,1);
\draw[thick, ->]
  (0.25, 0.25) -- (0.25, 0.75) -- (0.75, 0.75) -- (0.75, 0.25);
\node[below, font=\small] at (0.5,-0.08)
  {$N=4,\; r=\tfrac{1}{2},\; D=2$};
\end{tikzpicture}
$

---

## ⑤ Hyperbolic Components: Distribution and Symmetry

<!-- 【核对】本段『$S=(S)^c$（support is its own closure）』记号可疑：(·)^c 通常表示补集，用来表达『等于闭包/完美集』会误读。建议改为 S=\overline{S}（S 为闭集/完美集）。另 Wiener–Lévy 处的『Wiener–Lairy』为讹误，建议删除该转写。 -->

**Douady–Hubbard symmetry.** The distribution of hyperbolic components (mu-atoms and mu-molecules)
in the Mandelbrot set obeys a reflection symmetry across the real axis.

Let $S$ denote the support of a measure $\mu$. If $\mu$ is an **open** measure with constant density
on its support, then $S = (S)^c$ (i.e., the support is its own closure, or equivalently $S$ is a
perfect set), and the measure satisfies

$$d\mu(x) \text{ is supported on } S.$$

<!-- 【待补全】此公式是占位（仅把文字塞进公式环境，无数学内容）。请补真正定义：例如给出 μ 的密度/分布显式表达，或写成 supp μ = S 并说明 S 为完美集；否则建议删除该公式块。 -->

The associated **Fourier–Stieltjes transform** is

$$\hat{\mu}(f) = \int e^{2\pi i x f} \, d\mu(x).$$

The quantity $\max_{0 \le s \le t} X(t)$ refers to the **running maximum** of a stochastic process
$X(t)$; in the context of Brownian motion and fractal measures this connects to the
**Wiener–Lévy** function (the distribution of the maximum of a Brownian path), also written
"Wiener–Lairy" in some transliterations.

---
---

# Page 2

## Koch Curve / Monkey Tree

<!-- 【待补全】标题写 Koch Curve / Monkey Tree，但本节只讲 Monkey tree（D≈1.8687），无 Koch 内容；Koch 实际在后面『⑦ Sausage Set and the Koch Curve』。请二选一：删去标题中的 Koch，或在此补 Koch 曲线段落。另：正文把 monkey tree 等同于 T-square fractal 疑似有误，T-square 维数为 2，与 1.8687 不符，请核对。 -->

$$D = 1.8687 > D_T = 1 \qquad \text{(Monkey tree fractal; topological dimension } D_T = 1\text{).}$$

The **monkey tree** (or "T-square fractal") is a self-similar tree with fractal dimension
approximately 1.8687, strictly greater than its topological dimension of 1.

---

## ⑦ Sausage Set and the Koch Curve

**Minkowski sausage.** When the $\varepsilon$-neighbourhood $B_\varepsilon(S)$ is applied to a
curve (motivated by Norbert Wiener's Brownian motion), the boundary of the resulting "sausage"
retains fractal structure.

For the **Koch curve** (3-Koch bend), the $\varepsilon$-length (the number of steps of size
$\varepsilon$ needed to traverse the curve) satisfies

$$L(\varepsilon) = \varepsilon^{1-D}, \qquad D = \frac{\log 4}{\log 3} \approx 1.2618.$$

The self-similarity relation is $L\!\left(\tfrac{\varepsilon}{3}\right) = \tfrac{4}{3}\, L(\varepsilon)$, confirming $D \approx 1.2618$.

---

### General Dimension Formula

For a self-similar fractal with $N$ self-similar pieces each scaled by ratio $r$:

$$\boxed{D = \frac{\log N}{\log(1/r)}.}$$

---

### Fractal Example 1 — H-Fractal (8-copy)

$$N = 8, \quad r = \tfrac{1}{4}, \quad D = \frac{\log 8}{\log 4} = \frac{3\log 2}{2\log 2} = \tfrac{3}{2} = 1.5000.$$

```tikz
\begin{tikzpicture}[scale=2.5]
% Level-0 bounding square (outline only)
\draw[thick] (0,0) rectangle (1,1);
% Level-1: 8 self-similar copies at scale 1/4
% Four corners
\fill[gray!50] (0,0)      rectangle (0.25,0.25);
\fill[gray!50] (0.75,0)   rectangle (1,0.25);
\fill[gray!50] (0,0.75)   rectangle (0.25,1);
\fill[gray!50] (0.75,0.75)rectangle (1,1);
% Four edge-midpoints (the "H" connectors)
\fill[gray!50] (0,0.375)    rectangle (0.25,0.625);
\fill[gray!50] (0.75,0.375) rectangle (1,0.625);
\fill[gray!50] (0.375,0)    rectangle (0.625,0.25);
\fill[gray!50] (0.375,0.75) rectangle (0.625,1);
\node[below, font=\small] at (0.5,-0.1)
  {$N=8,\; r=\tfrac{1}{4},\; D=\tfrac{3}{2}=1.5$};
\end{tikzpicture}
```

<!-- 【核对】Moran/Hutchinson 方程标准形式为 ∑_n r_n^D = 1。文中引入未定义的 G(D) 写成 ∑ r_n^D = G(D) 再令 G(D)=1，表述含糊。建议直接写 ∑_n r_n^D = 1 并说明等比情形退化为 D=log N/log(1/r)。 -->

The associated **Moran equation** (or **Hutchinson equation**) is
$$\sum_{n} r_n^D = G(D),$$
with the solution satisfying $G(D) = 1$ for $D \in \mathbb{R}$.

---

### Fractal Example 2 — Peano Curve (9-copy)

$$N = 9, \quad r = \tfrac{1}{3}, \quad D = \frac{\log 9}{\log 3} = 2.$$

The **Peano curve** $P_n : [0,1] \to [0,1]^2$ is the classical space-filling curve; at each level
the unit interval is mapped through all $3^{2n}$ cells of the $3^n \times 3^n$ grid.

```tikz
\begin{tikzpicture}[scale=1.8]
% 3x3 grid
\draw[gray!40, step=0.333] (0,0) grid (1,1);
% Peano curve path (level 1, boustrophedon / serpentine order)
\draw[thick, ->]
  (0.167, 0.167) -- (0.167, 0.500) -- (0.167, 0.833)
  -- (0.500, 0.833) -- (0.500, 0.500) -- (0.500, 0.167)
  -- (0.833, 0.167) -- (0.833, 0.500) -- (0.833, 0.833);
% Mark cell centres
\foreach \x in {0.167, 0.500, 0.833}
  \foreach \y in {0.167, 0.500, 0.833}
    \fill[black] (\x,\y) circle (0.015);
\node[below, font=\small] at (0.5,-0.08)
  {$N=9,\; r=\tfrac{1}{3},\; D=2$; \ $P_n:[0,1]\to[0,1]^2$};
\end{tikzpicture}
```

**Remark on composition** (映射相加): Fractal maps can be composed additively, building
higher-level approximations by iterating the self-similar rule.

<!-- 【续写建议】此 Remark 戛然而止且『映射相加/additive composition』说法不标准（IFS 是各压缩映射像的并集 ∪ fᵢ(A)，非相加）。建议改写为：介绍 Hutchinson 算子 W(A)=∪ fᵢ(A) 及其不动点 = 吸引子，并说明逐级逼近过程，补完整这一段。 -->

---

## ① Fréchet Distance on Curves (Piano Distance)

<!-- 【核对】标题笔误：『Piano Distance』应为『Peano Distance』。另：Fréchet 距离与 Peano（空间填充）距离是不同概念，标题并列易混；请确认本节主题并相应修正标题与定义。 -->

For two curves $P_1, P_2$ parameterised in the plane, define the **curve distance**

$$K\{P_1, P_2\} = \bigl|\mathcal{L}\{P_1, P_2\}\bigr| + \bigl|\mathcal{C}\{P_2, P_3\}\bigr|,$$

<!-- 【核对】下标错乱：左端为 P1,P2，右端第二项却出现 P3；其后下界 |PP2|^2 中的 P 未定义。请核对：右端应为 C{P1,P2}，并明确 |P1P2| 的含义。整节 Fréchet 距离定义与标准定义不符，疑似抄写未完成，请重写定义式。 -->

where $\mathcal{L}$ and $\mathcal{C}$ denote the **length** and **curvature** components
respectively. This measures arc-length in areas (2D regions) rather than along a 1D path. One can
show the lower bound

$$K\{P_1, P_2\} \ge |PP_2|^2.$$

**Self-overlapping broken lines** arise in the Peano–Cesàro construction (also called
"Peano–Chessaro" in some sources), where the approximating polygonal paths overlap themselves before
converging to the space-filling limit.

---

## ② Kakeya–Gomory Problem (角谷–戈莫里)

<!-- 【核对】命名三处不一致：英文 Kakeya、中文『角谷』(=Kakutani)、下方 Note 又写 Kakutani。挂谷（Kakeya，针问题/Besicovitch）中文应为『挂谷』，角谷（Kakutani，不动点定理）为另一人。请先确定本节到底讲哪一个，再统一中英文标题与正文。 -->

The **Kakeya problem** (needle problem) asks for the minimum area set in the plane in which a unit
line segment can be rotated through all directions. In the fractal setting this connects to
Besicovitch sets and the following infimum problem over all polygonal approximations $\{P_n\}$:

$$\inf \sum_n \left|P_n P_{n+1}\right|^2.$$

<!-- 【待补全】下方 Note 首句被截断：标题后空行直接接『rendering of "Kakutani–Gomory."』，缺主语开头。建议补全为：『The handwritten title "角谷–戈莫里" is most likely a garbled rendering of "Kakutani–Gomory."』再接后文。 -->

> **Terminological note.** 
> rendering of "Kakutani–Gomory." These are two separate figures: **Shizuo Kakutani** (fixed-point theorem in functional analysis / game theory) and **Ralph Gomory** (cutting-plane method in
> integer programming). In the fractal/geometric context here, the combination likely refers to the
> **Kakeya conjecture** (minimum Besicovitch set) together with Gomory-type combinatorial
> decomposition arguments for broken-line paths, both of which minimise the sum of squared
> chord lengths over all approximating polygonals.

---

## ③ Twin Dragon, Cantor Dust, Saturn Ring

These are classical self-similar fractals appearing also as **spectra of certain organic molecules**
(e.g., as level-spacing distributions in spectral theory and quasicrystal diffraction).

$$N = 2, \quad r = \tfrac{1}{\sqrt{2}}, \quad D = \frac{\log 2}{\log \sqrt{2}} = \frac{\log 2}{\tfrac{1}{2}\log 2} = 2.$$

> **Correction note.** The handwritten value $D \approx 0.6309$ applies to the **Cantor set**
> ($N = 2$, $r = 1/3$: $D = \log 2/\log 3 \approx 0.6309$), not to the Twin Dragon. The Twin
> Dragon has $N = 2$, $r = 1/\sqrt{2}$, giving $D = 2$ — it is a plane-filling fractal whose
> boundary has Hausdorff dimension greater than 1. The notes appear to conflate the two examples;
> the dimension formula and diagram below reflect the Twin Dragon, while the value $\approx 0.6309$
> belongs to the standard middle-thirds Cantor set.

```tikz
\begin{tikzpicture}[scale=2.2]
% Twin Dragon — level-2 approximation
% The Twin Dragon is the attractor of the IFS:
%   f1(z) = (z + 1)(1+i)/2,  f2(z) = (z - 1)(1+i)/2
% We draw a schematic approximation as two interlocked spiralling triangles.
% Base dragon (level 0): two triangles sharing the base [0,1]
\draw[thick] (0,0) -- (0.5, 0.5) -- (1,0) -- cycle;
\draw[thick] (0,0) -- (0.5,-0.5) -- (1,0) -- cycle;
% Level-1 subdivision lines
\draw[gray] (0,0)   -- (0.25, 0.25) -- (0.5,0);
\draw[gray] (0.5,0) -- (0.75, 0.25) -- (1,0);
\draw[gray] (0,0)   -- (0.25,-0.25) -- (0.5,0);
\draw[gray] (0.5,0) -- (0.75,-0.25) -- (1,0);
% Level-2 (finer lines)
\draw[gray!50] (0,0)    -- (0.125, 0.125) -- (0.25,0);
\draw[gray!50] (0.25,0) -- (0.375, 0.125) -- (0.5,0);
\draw[gray!50] (0,0)    -- (0.125,-0.125) -- (0.25,0);
\draw[gray!50] (0.25,0) -- (0.375,-0.125) -- (0.5,0);
\draw[gray!50] (0.5,0)  -- (0.625, 0.125) -- (0.75,0);
\draw[gray!50] (0.75,0) -- (0.875, 0.125) -- (1,0);
\draw[gray!50] (0.5,0)  -- (0.625,-0.125) -- (0.75,0);
\draw[gray!50] (0.75,0) -- (0.875,-0.125) -- (1,0);
\node[below, font=\small] at (0.5,-0.6)
  {Twin Dragon: $N=2,\ r=\tfrac{1}{\sqrt{2}},\ D=2$};
\node[below, font=\footnotesize] at (0.5,-0.77)
  {(Cantor set: $N=2,\ r=\tfrac{1}{3},\ D=\log 2/\log 3 \approx 0.6309$)};
\end{tikzpicture}
```

**"Curdling"** (凝乳化): 這是一個由分形幾何之父本華·曼德博（Benoit Mandelbrot）提出的專業術語，用來描述一種產生分形塵埃（Fractal Dust）或隨機分形結構的數學過程。

<!-- 【结构】体例不统一：全文为英文，此处插入整段繁体中文。建议翻译为英文（保留 Curdling/凝乳化 括注），与全文语言保持一致。 -->

---

## Appendix: Summary of Fractal Examples

<!-- 【核对】附录表与正文已基本自洽（Koch N=4,r=1/3,D≈1.2618；H-Fractal 8,1/4,3/2；Twin Dragon 2,1/√2,2；Cantor 2,1/3,0.6309 均一致）。两点建议补全：(1) Monkey Tree 行的 N,r 为『—』，可补其构造参数；(2) 表中两条 Peano（Random Peano 4,1/2 与 Peano 9,1/3）命名易混，建议在备注列注明前者为 Hilbert/Peano 型 2×2 构造。 -->

| Fractal | $N$ | $r$ | $D = \log N / \log(1/r)$ |
|---|---|---|---|
| Random Peano Curve | 4 | $1/2$ | $2$ |
| Koch Curve | 4 | $1/3$ | $\log 4/\log 3 \approx 1.2618$ |
| H-Fractal (8-copy) | 8 | $1/4$ | $3/2 = 1.5$ |
| Peano Curve (9-copy) | 9 | $1/3$ | $2$ |
| Twin Dragon | 2 | $1/\sqrt{2}$ | $2$ |
| Cantor Set | 2 | $1/3$ | $\log 2/\log 3 \approx 0.6309$ |
| Monkey Tree | — | — | $\approx 1.8687$ |
