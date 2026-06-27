以下是根据您提供的报告《PrimeGapsOberwolfach1.pdf》整理的 Markdown 版本，并附有注释。注释以 **【注】** 开头，解释报告中的关键概念、背景或数学对象。

<!-- 【完成度】本文为 Sutherland（代表 D.H.J. Polymath）Oberwolfach 报告的中文整理+【注】转写稿，约 96% 完成，结构首尾完整，可直接发布。属翻译转写而非原创，建议在文首注明出处（作者、会议、日期、PDF 名）与“本文为转写整理”声明，并保留原作者署名。发布前仅需核对两处：(1) θ(x;q,a) 偏差不等式左端疑漏负号（见该处【核对】）；(2) 若干表格数值（如 H=55,233,504）与原报告对照。 -->

---

# 筛法与素数间的有界差距：导引

**Andrew V. Sutherland**
麻省理工学院
（代表 D.H.J. Polymath）

显式方法在数论中的应用
**OBERWOLFACH 数学研究所**
2015 年 7 月 6 日

---

## 历史回顾

定义
\[
\Delta_m := \liminf_{n \to \infty} \frac{p_{n+m} - p_n}{\log p_n}, \qquad
H_m := \liminf_{n \to \infty} (p_{n+m} - p_n)
\]

孪生素数猜想： \(H_1 = 2\)
素数 \(k\)-元组猜想： \(H_m \sim m \log m\)

**【注】** \(\Delta_m\) 是相邻素数差与对数之比的下极限，而 \(H_m\) 是间隔本身的下极限。报告的目标是给出 \(H_m\) 的上界。

| 年份 | 成果                           | 说明                                                                    |
| ---- | ------------------------------ | ----------------------------------------------------------------------- |
| 1896 | Hadamard-de la Vallée Poussin | \(\Delta_1 \le 1\)                                                      |
| 1926 | Hardy-Littlewood               | \(\Delta_1 \le 2/3\) （假设 GRH）                                       |
| 1940 | Rankin                         | \(\Delta_1 \le 3/5\) （假设 GRH）                                       |
| 1940 | Erdős                         | \(\Delta_1 < 1\)                                                        |
| 1956 | Ricci                          | \(\Delta_1 \le 15/16\)                                                  |
| 1965 | Bombieri-Davenport             | \(\Delta_1 \le 1/2\), \(\Delta_m \le m - 1/2\)                          |
| 1988 | Maier                          | \(\Delta_1 < 0.2485\)                                                   |
| 2005 | Goldston-Pintz-Yıldırım     | \(\Delta_1 = 0\), \(\Delta_m \le m - 1\), EH \(\Rightarrow H_1 \le 16\) |
| 2013 | **Zhang**                | \(H_1 < 70,000,000\)                                                    |
| 2013 | Polymath 8a                    | \(H_1 \le 4680\)                                                        |
| 2013 | **Maynard-Tao**          | \(H_1 \le 600\), \(H_m \le m^3 e^{4m}\), EH \(\Rightarrow H_1 \le 12\)  |
| 2014 | Polymath 8b                    | \(H_1 \le 246\), \(H_m \le e^{3.815m}\), GEH \(\Rightarrow H_1 \le 6\)  |
|      |                                | \(H_2 \le 398,130\), \(H_3 \le 24,797,814\), ...                        |

**【注】** EH 指 Elliott-Halberstam 猜想，GEH 是推广的 Elliott-Halberstam 猜想。GRH 为广义黎曼假设。表格展示了从解析方法到筛法的演进，以及 Polymath 合作带来的巨大改进。

---

## 算术级数中的素数定理

定义加权素数计数函数
\[
\Theta(x) := \sum_{\text{素数 } p \le x} \log p, \qquad
\Theta(x; q, a) := \sum_{\substack{\text{素数 } p \le x \\ p \equiv a \bmod q}} \log p.
\]

素数定理： \(\Theta(x) \sim x\)，且对 \(a \perp q\) 有
\[
\Theta(x; q, a) \sim \frac{x}{\phi(q)}.
\]

我们关心的是这两个量之间的偏差。
显然有
\[
\frac{x}{\phi(q)} \le \Theta(x; q, a) - \frac{x}{\phi(q)} \le \left(\frac{x}{q} + 1\right) \log x,
\]

<!-- 【核对】此不等式左端疑为笔误：应是 -x/φ(q) ≤ Θ(x;q,a)-x/φ(q)（带负号）。理由：由平凡界 0 ≤ Θ(x;q,a) ≤ (x/q+1)log x，两边同减 x/φ(q) 即得下界为 -x/φ(q)。现写成 +x/φ(q) 会错误暗示该偏差恒为正。请对照原 slides 改为负号。 -->
并且对任意 \(Q < x\) 有
\[
\sum_{q \le Q} \max_{a \perp q} \left|\Theta(x; q, a) - \frac{x}{\phi(q)}\right| \le \sum_{q \le Q} \left(\frac{2x \log x}{q} + \frac{x}{\phi(q)}\right) \ll x (\log x)^2.
\]

**【注】** \(\Theta(x)\) 是 Chebyshev 函数 \(\psi(x)\) 去掉素数幂项的形式。这里的偏差估计是后面讨论均值分布的基础。

---

## Elliott-Halberstam 猜想

对任意 \(0 < \theta < 1\)，用 \(\mathrm{EH}[\theta]\) 表示断言：对任何 \(A \ge 1\) 有
\[
\sum_{q \le x^{\theta}} \max_{a \perp q} \left| \Theta(x; q, a) - \frac{x}{\phi(q)} \right| \ll \frac{x}{(\log x)^A}.
\]

1965年：Bombieri 和 Vinogradov 证明了所有 \(\theta < 1/2\) 的 \(\mathrm{EH}[\theta]\)。
1968年：Elliott 和 Halberstam 猜想对所有 \(\theta < 1\) 成立。

**【注】** Bombieri-Vinogradov 定理是解析数论的基石，其水平 \(\theta = 1/2\) 是许多筛法应用的极限。张益唐突破的关键就在于借助额外的光滑性条件，在 \(\theta = 1/2\) 附近得到类似 EH 的效果。

---

## 可容许性

设 \(\mathcal{H} = \{h_1, \dots, h_k\}\) 为 \(k\) 个整数的集合。若 \(\mathcal{H}\) 不对任何素数模构成完全剩余系，则称 \(\mathcal{H}\) 为 **可容许的**。

不可容许的例子：\(\{0,1\}, \{0,2,4\}, \{0,2,6,8,12,14\}\)
可容许的例子：\(\{0\}, \{0,2\}, \{0,2,6\}, \{0,4,6\}, \{0,4,6,10,12,16\}\)

令 \(\pi(n + \mathcal{H})\) 计数 \(n + \mathcal{H} := \{n+h_1, \dots, n+h_k\}\) 中的素数。

**猜想 (Hardy-Littlewood 1923)**
若 \(\mathcal{H}\) 是可容许的 \(k\)-元组，则存在显式常数 \(c_{\mathcal{H}} > 0\) 使得
\[
\pi_{\mathcal{H}}(x) := \#\{n \le x : \pi(n+\mathcal{H}) = k\} \sim c_{\mathcal{H}} \int_{2}^{x} \frac{dt}{(\log t)^k}.
\]

**【注】** 可容许性是排除“显然”障碍的最小条件。若某素数 \(p\) 下覆盖所有剩余类，则对任意 \(n\)，必有一项被 \(p\) 整除，从而不可能全是素数。

---

## GPY 定理

用 \(\mathrm{DHL}[k, r]\) 表示：对每个可容许的 \(k\)-元组 \(\mathcal{H}\)，有无穷多个 \(n\) 使得 \(\pi(n+\mathcal{H}) \ge r\)。记 \(\mathrm{diam}(\mathcal{H}) := \max(\mathcal{H}) - \min(\mathcal{H})\)。
则 \(\mathrm{DHL}[k, m+1] \Rightarrow H_m \le \mathrm{diam}(\mathcal{H})\) 对某个可容许 \(k\)-元组成立。

**定理 (Goldston-Pintz-Yıldırım 2005)**
对 \(0 < \theta < 1\)，若整数 \(k \ge 2\) 和 \(\ell \ge 1\) 满足
\[
2\theta > \left(1 + \frac{1}{2\ell+1}\right)\left(1 + \frac{2\ell+1}{k}\right),
\]
则 \(\mathrm{EH}[\theta] \Rightarrow \mathrm{DHL}[k, 2]\)。特别地，\(\mathrm{EH}[1/2 + \epsilon] \Rightarrow H_1 < \infty\)。

**【注】** GPY 定理揭示了素数分布水平 \(\theta\) 一旦超过 \(1/2\)，就能得到有界间隔。然而已知的 Bombieri-Vinogradov 定理只能给出 \(\theta = 1/2\)，因此他们只得到了 \(\Delta_1 = 0\)，而非 \(H_1\) 的有界性。

---

## GPY 方法

设 \(\Theta(n + \mathcal{H}) := \sum_{n+h_i \text{ 素数}} \log(n+h_i)\)，其中 \(\mathcal{H} = \{h_1, \dots, h_k\}\)。
要证明 \(\mathrm{DHL}[k, m+1]\)，只需对任意可容许 \(k\)-元组 \(\mathcal{H}\)，存在非负权函数 \(w_n\) 使得
\[
\sum_{x < n \le 2x} w_n \big( \Theta(n+\mathcal{H}) - m \log(3x) \big) > 0 \tag{1}
\]
对充分大的 \(x\) 成立。

**【注】** 若 (1) 成立，则必存在某个 \(n\) 使得括号内为正，即 \(n+\mathcal{H}\) 中至少有 \(m+1\) 个素数。权函数 \(w_n\) 的选取就是筛法的核心。

---

## 张益唐定理

**MPZ 条件**
记 \(\mathrm{MPZ}[\varpi, \delta]\) 为以下断言：对任何 \(A \ge 1\) 有
\[
\sum_q \left| \Theta(x; q, a) - \frac{x}{\phi(q)} \right| \ll \frac{x}{(\log x)^A},
\]
其中 \(q\) 遍历 \(x^\delta\)-光滑的无平方因子整数，大小不超过 \(x^{1/2 + 2\varpi}\)，而 \(a\) 是一个固定的 \(x^\delta\)-粗糙整数（依赖于 \(x\)，但不依赖 \(q\)）。

**【注】** “光滑”指所有素因子不大于 \(x^\delta\)；“粗糙”指所有素因子都大于 \(x^\delta\)。MPZ 可以看作一个受限模下的 Bombieri-Vinogradov 型均值估计。

**定理 (Zhang 2013)**
对任意 \(\varpi, \delta > 0\) 和充分大的 \(k\)，有
\[
\mathrm{MPZ}[\varpi, \delta] \Rightarrow \mathrm{DHL}[k, 2].
\]
并且 \(\mathrm{MPZ}[\varpi, \delta]\) 对所有 \(\varpi, \delta \le 1/1168\) 成立。

---

## 张益唐的结果

取 \(\varpi = \delta = 1/1168\)，张证明了 \(\mathrm{DHL}[k, 2]\) 对所有
\[
k \ge 3.5 \times 10^6
\]
成立。对于 \(k = 3.5 \times 10^6\)，取大于 \(k\) 的前 \(k\) 个素数构成可容许 \(k\)-元组，其直径小于 \(7 \times 10^7\)（实际小于 \(6 \times 10^7\)）。从而
\[
H_1 = \liminf_{n \to \infty} (p_{n+1} - p_n) < 7 \times 10^7.
\]

**【注】** 这里 \(k\) 必须非常巨大，主要原因是在 GPY 框架下，主项的优势依赖于 \(k\)。张益唐的参数 \(\varpi\) 极小，导致所需 \(k\) 很大。后续 Polymath 优化大幅降低了 \(k\)。

---

## Polymath 项目

**Polymath8a 目标：**

- 改进张的 \(H_1\) 上界
- 更好地理解和精炼张的论证

子课题：

- 通过构造窄的可容许 \(k\)-元组来最小化 \(H(k)\)
- 最小化使得 \(\mathrm{MPZ}(\varpi, \delta) \Rightarrow \mathrm{DHL}(k, 2)\) 所需的 \(k\)
- 最大化使 \(\mathrm{MPZ}(\varpi, \delta)\) 成立的 \(\varpi\)

相关问题：

- Weil 猜想起什么作用？
- \(\mathrm{MPZ}(\varpi, \delta)\) 中的假设能否被有益地修改？

---

## Polymath 8a 结果

<!-- 【核对】请核对下表中 H=55,233,504 是否与原报告一致。部分 Polymath8a 公开材料对同一 (k=3.5×10^6，仅优化可容许元组宽度) 报道的直径值与此略有出入，疑似转写差异。整张 Polymath8a 结果表数值密集，建议逐格与原 slides 对照一次。 -->

| \(\varpi, \delta\)            | \(k\)     | \(H\)      | 注释                          |
| ----------------------------- | --------- | ---------- | ----------------------------- |
| \(\varpi = \delta = 1/1168\)  | 3,500,000 | 70,000,000 | 张的原始论文                  |
| \(\varpi = \delta = 1/1168\)  | 3,500,000 | 55,233,504 | 优化\(H=H(k)\)                |
| \(\varpi = \delta = 1/1168\)  | 341,640   | 4,597,926  | 优化\(k=k(\varpi,\delta)\)    |
| \(\varpi = \delta = 1/1168\)  | 34,429    | 386,344    | 使\(k \propto \varpi^{-3/2}\) |
| \(828\varpi + 172\delta < 1\) | 22,949    | 248,816    | 允许\(\varpi \ne \delta\)     |
| \(280\varpi + 80\delta < 3\)  | 873       | 6712       | 加强 MPZ                      |
| \(280\varpi + 80\delta < 3\)  | 720       | 5414       | 使\(k\) 对 \(\delta\) 不敏感  |
| \(600\varpi + 180\delta < 7\) | 632       | 4680       | 进一步优化\(\varpi, \delta\)  |
| 仅用曲线的 Riemann 假设：     |           |            |                               |
| \(168\varpi + 48\delta < 1\)  | 1783      | 14,950     |                               |

**【注】** 从最初的 7 千万到最后的 4680，Polymath 8a 通过精细的参数优化以及不依赖 Deligne 定理的初等化处理（最后一行）大幅降低了结果。

---

## 优化后的 GPY 定理

在 GPY 原定理和张益唐结果中，有 \(k \propto \varpi^{-2}\)。这可以改进为 \(k \propto \varpi^{-3/2}\)。

**定理 (D.H.J. Polymath 2013)**
设 \(k \ge 2\)，\(0 < \varpi < 1/4\)，\(0 < \delta < 1/4 + \varpi\) 满足
\[
(1+4\varpi)(1-\kappa) > \frac{j_{k-2}^2}{k(k-1)},
\]
其中 \(j_k\) 是第一类 Bessel 函数 \(J_k\) 的第一个正零点，\(\kappa = \kappa(\varpi, \delta, k)\) 是一个显式的误差项。
则 \(\mathrm{MPZ}[\varpi, \delta] \Rightarrow \mathrm{DHL}[k, 2]\)。
此外，\(\mathrm{EH}[1/2 + 2\varpi] \Rightarrow \mathrm{DHL}[k, 2]\) 且 \(\kappa = 0\)。

我们已知 \(j_n = n + c n^{1/3} + O(n^{-1/3})\)，因此 \(\frac{j_{k-2}^2}{k(k-1)} \sim 1 + 2c k^{-2/3}\)。

**【注】** Bessel 函数的零点来源于对优化问题中矩阵的特征值估计。这使得依赖关系从 \(\varpi^{-2}\) 降为 \(\varpi^{-3/2}\)，是参数改进的关键。

---

## 密集整除性 (Dense Divisibility)

对每个 \(i \in \mathbb{Z}_{\ge 0}\) 和 \(y \in \mathbb{R}_{\ge 1}\)，定义 **\(i\)-重 \(y\)-密集可除性**：

- 每个自然数 \(n\) 都是 \(0\)-重 \(y\)-密集可除的。
- \(n\) 是 \(i\)-重 \(y\)-密集可除的，如果对所有满足 \(j+k = i-1\) 的 \(j,k \ge 0\) 以及任意 \(1 \le R \le y n\)，都能将 \(n\) 分解为 \(n = qr\)，其中 \(q\) 是 \(j\)-重 \(y\)-密集可除的，\(r\) 是 \(k\)-重 \(y\)-密集可除的，并且 \(\frac{1}{y}R \le r \le R\)。

这可以看作 \(y\)-光滑性的推广：
\(n\) 是 \(y\)-光滑的 \(\iff\) \(n\) 对所有 \(i\) 都是 \(i\)-重 \(y\)-密集可除的。
但对固定的 \(i, y\)，\(i\)-重 \(y\)-密集可除的整数 \(n\) 的最大素因子可以是无界的。

例子（\(i\)-重 \(5\)-密集可除但不是 \(5\)-光滑的 \(n \le 100\)）：

- \(i=1\)：14, 21, 33, 35, 39, 44, 52, 55, 65, 66, 68, 76, 78, 85, 88, 95, 98
- \(i=2\)：28, 42, 63, 70, 99
- \(i=3\)：56, 84

**【注】** 密集可除性提供了一个比光滑性更灵活的除数结构，使得在证明 MPZ 的变体时可以摆脱对 Deligne 定理的依赖，并允许 \(\varpi\) 更大。

---

## MPZ 的加强形式

记 \(\mathrm{MPZ}^{(i)}[\varpi, \delta]\) 为将 \(\mathrm{MPZ}[\varpi, \delta]\) 中模 \(q\) 的 \(x^\delta\)-光滑性替换为 \(i\)-重 \(x^\delta\)-密集可除性的断言。

则对每个 \(i \ge 0\)，有 \(\mathrm{MPZ}^{(i)}[\varpi, \delta] \Rightarrow \mathrm{MPZ}[\varpi, \delta] \Rightarrow \mathrm{DHL}[k, 2]\)。
但这个蕴含关系可以直接证明，且能使 \(k\) 大致与 \(\delta\) 无关；这让我们可以增大 \(\varpi\) 并减小 \(k\)。

**定理 (D.H.J. Polymath 2013)**
(i) \(\mathrm{MPZ}^{(4)}[\varpi, \delta]\) 对所有满足 \(600\varpi + 180\delta < 7\) 的 \(\varpi, \delta > 0\) 成立。
(ii) \(\mathrm{MPZ}^{(2)}[\varpi, \delta]\) 对所有满足 \(168\varpi + 48\delta < 1\) 的 \(\varpi, \delta > 0\) 成立，且其证明不需要 Deligne 的任何结果。

**【注】** 这是 Polymath 8a 的一项重要成就：将张益唐证明中深层代数几何（Weil 猜想）的部分用初等组合分解替代，同时获得了更好的数值条件。

---

## 变分问题

设 \(F: [0,1]^k \to \mathbb{R}\) 为非零平方可积函数，支撑在单纯形 \(\mathcal{R}_k := \{(x_1,\dots,x_k) \in [0,1]^k : \sum_i x_i \le 1\}\) 上。

定义
\[
\begin{aligned}
I(F) &:= \int_0^1 \cdots \int_0^1 F(t_1,\dots,t_k)^2 \, dt_1 \dots dt_k, \\
J(F) &:= \sum_{i=1}^k \int_0^1 \cdots \int_0^1 \left( \int_0^1 F(t_1,\dots,t_k) \, dt_i \right)^2 dt_1 \dots dt_{i-1} dt_{i+1} \dots dt_k, \\
\rho(F) &:= \frac{J(F)}{I(F)}, \quad M_k := \sup_F \rho(F).
\end{aligned}
\]

**定理 (Maynard 2013)**
对于任意 \(0 < \theta < 1\)，若 \(\mathrm{EH}[\theta]\) 且 \(M_k > \frac{2m}{\theta}\)，则 \(\mathrm{DHL}[k, m+1]\)。

**【注】** 这是 Maynard-Tao 方法的中心结果。将素数间隙问题转化为一个纯粹的多变量极值问题。函数 \(F\) 扮演了筛法权重的角色，其积分比 \(\rho(F)\) 决定了主项的优势。

---

## 显式界定 \(M_k\)

为证明 \(M_k > \frac{2m}{\theta}\)，只需给出一个函数 \(F\) 使得 \(\rho(F) > \frac{2m}{\theta}\)。

Maynard 考虑由如下多项式定义的 \(F\)：
\[
P := \sum_{a+2b \le d} c_{a,b} (1-P_1)^a P_2^b,
\]
其中 \(P_1 := \sum_i t_i\)，\(P_2 := \sum_i t_i^2\)，支撑限制在 \(\mathcal{R}_k\) 上。

于是 \(\rho(F)\) 成为关于系数 \(c_{a,b}\) 的二次型之比，完全由 \(k\) 和 \(d\) 决定。
若 \(\mathbf{I}\) 和 \(\mathbf{J}\) 是对应二次型的矩阵（实、对称、正定），我们需要选择 \(k\) 和 \(d\) 使得 \(\mathbf{I}^{-1}\mathbf{J}\) 有一个特征值 \(\lambda > 4m\)，对应的特征向量即给出系数 \(c_{a,b}\)。

<!-- 【核对】此处判据写成特征值 λ>4m，对应无条件情形 θ=1/2（即 2m/θ=4m）；而上一节 Maynard 定理（M_k>2m/θ）及下面 k=5 例子是在 EH（θ=1，阈值 2m=2）下叙述的。两种 θ 在原报告不同页切换，转写时易混淆。建议加一句说明：“此 4m 对应无条件 Bombieri-Vinogradov 水平 θ=1/2；EH 下阈值为 2m”，以免读者在紧接的 EH 例子中产生矛盾感。 -->

---

## 例子：\(k=5, d=3\)

可显式计算行/列索引为 \(c_{0,0}, c_{0,1}, c_{1,0}, c_{1,1}, c_{2,0}, c_{3,0}\) 的矩阵。
\(\mathbf{I}^{-1}\mathbf{J}\) 的最大特征值约 \(2.0027\)。近似特征向量为
\[
\mathbf{a} = [0,5,-15,70,49,0],
\]
使得
\[
\frac{\mathbf{a}^T \mathbf{J} \mathbf{a}}{\mathbf{a}^T \mathbf{I} \mathbf{a}} = \frac{1417255}{708216} > 2.
\]
因此由 \(P = 5P_2 - 15(1-P_1) + 70(1-P_1)P_2 + 49(1-P_1)^2\) 定义的 \(F\) 满足 \(\rho(F) > 2\)。
故 \(M_5 > 2\)；在 EH 下得到 \(\mathrm{DHL}[5,2]\) 和 \(H_1 \le 12\)（使用 \(\{0,4,6,10,12\}\)）。

取 \(k=105, d=11\) 得 \(M_{105} > 4\)，无条件下得 \(\mathrm{DHL}[105,2]\) 和 \(H_1 \le 600\)。

**【注】** 这个具体的构造展示了 Maynard 方法无需任何深奥的调和分析或代数几何，仅通过精巧的多项式选择和平凡的线性代数就获得了强有力的结果。

---

## Dickson 猜想

**猜想 (Dickson 1904)**
每个可容许的 \(k\)-元组有无穷多个平移全部由素数组成（Dickson \(k\)-元组）。

Maynard-Tao 定理推出对每个 \(k \ge 2\)，有正比例的可容许 \(k\)-元组是 Dickson \(k\)-元组。更精确地，存在常数 \(c=c(k)>0\)，使得对所有充分大的 \(x\)，\([1,x]\) 中是 Dickson \(k\)-元组的 \(k\)-元组所占比例大于 \(c\)。

证明思路：令 \(m=k-1\) 和 \(K = m^3 e^{4m+5}\)，则每个可容许 \(K\)-元组包含至少一个 Dickson \(k\)-元组。再通过简单下界估计完成。

**【注】** 这虽然离 Dickson 猜想还很远，但首次给出了该猜想的定量正密度结果。

---

## Polymath 8b 项目

**目标：**

1. 改进 Maynard 关于 \(H_1\) 的界以及 \(H_m\) 的渐近。
2. 得到 \(m=2,3,4,\dots\) 时的显式 \(H_m\) 上界。

子课题：

1. 为大的 \(k\) 构造窄的可容许 \(k\)-元组。
2. 给出 \(M_k\) 的显式下界。
3. 找到如何用 \(\mathrm{MPZ}[\varpi,\delta]\) 替代 \(\mathrm{EH}[1/2+2\varpi]\)。

关键问题：

1. Maynard 用特定形式的 \(F\) 来界定 \(M_k\)，更复杂的 \(F\) 是否效果更好？
2. 张益唐的工作和 Polymath8a 的结果能在多大程度上与 Maynard-Tao 方法结合？

---

## Polymath 8b 部分结果表格

<!-- 【结构】下表以省略号收尾，仅列到 m=3；但后文「Polymath 8b 结果（结合 MPZ）」一节给出了 m=4（H_4=1,431,556,072）与 m=5（H_5=80,550,202,480）。建议直接补全这两行，或加一句“更多 m 见后文表格”交叉引用，避免读者误以为 m≥4 无显式结果。 -->

| \(k\)   | \(M_k\) | \(m\) | \(H_m\)    | 说明                      |
| ------- | ------- | ----- | ---------- | ------------------------- |
| 105     | 4       | 1     | 600        | Maynard 原始论文          |
| 102     | 4       | 1     | 576        | 优化 Maynard              |
| 54      | 4       | 1     | 270        | 更一般的\(F\)             |
| 50      | 4       | 1     | 246        | \(\epsilon\)-扩大单纯形   |
| 32      | 2       | 1     | 6 (GEH)    | 特例\(k=3\) 在 GEH 下得 6 |
| 35410   | —      | 2     | 398,130    | 结合 MPZ                  |
| 1649821 | —      | 3     | 24,797,814 | 结合 MPZ                  |
| ...     | ...     | ...   | ...        |                           |

还证明了
\[
\frac{k}{k-1} \log k - c < M_k \le \frac{k}{k-1} \log k,
\]
其中 \(c \approx 3\) 为有效常数。

**【注】** 最后的渐近界说明 \(M_k\) 随 \(k\) 增长极其缓慢，从而解释了即使极大的 \(k\) 也能导致相对小的 \(H_m\)。同时，在广义 EH 下，\(H_1 \le 6\) 的结果离孪生素数猜想已非常近。

---

## 广义间隔：\(\epsilon\)-扩大单纯形

固定 \(\epsilon \in (0,1)\)，设 \(F\) 是支撑在 \((1+\epsilon)\mathcal{R}_k\) 上的平方可积函数。定义
\[
J_{1-\epsilon}(F) := \sum_{i=1}^k \int_{(1-\epsilon)\mathcal{R}_{k-1}} \left( \int_0^{1+\epsilon} F(t_1,\dots,t_k) \, dt_i \right)^2 dt_1 \dots dt_{i-1} dt_{i+1} \dots dt_k,
\]
以及
\[
M_{k,\epsilon} := \sup_F \frac{J_{1-\epsilon}(F)}{I(F)}.
\]

**定理 (D.H.J. Polymath 2014)**
假设 \(\mathrm{EH}[\theta]\) 且 \(1+\epsilon < \frac{1}{\theta}\)，或者 \(\mathrm{GEH}[\theta]\) 且 \(\epsilon < \frac{1}{k-1}\)。
则 \(M_{k,\epsilon} > \frac{2m}{\theta}\) 蕴含 \(\mathrm{DHL}[k, m+1]\)。

取 \(M_{50,1/25} > 4\) 证明了 \(H_1 \le 246\)；取 \(M_{4,0.168} > 2\) 在 GEH 下得到 \(H_1 \le 8\)；为了在 GEH 下得到 \(H_1 \le 6\)，对 \(k=3\) 证明了特定结果。

**【注】** 扩大单纯形的技巧允许在 EH 条件不变的情况下提升 \(M_{k,\epsilon}\)，这正是 Polymath 8b 将 \(H_1\) 从 600 降低到 246 的关键技术。

---

## Polymath 8b 结果（结合 MPZ）

条件 \(600\varpi + 180\delta < 7\) 下的一些结果：

| \(k\)         | \(m\) | \(H_m\)        |
| ------------- | ----- | -------------- |
| 35,410        | 2     | 398,130        |
| 1,649,821     | 3     | 24,797,814     |
| 75,845,707    | 4     | 1,431,556,072  |
| 3,473,995,908 | 5     | 80,550,202,480 |

对比仅用 Bombieri-Vinogradov 得到 \(H_2 < 474,266\)，而非 \(398,130\)（但 \(H_1\) 无提升）。
还证明了 \(H_m \ll m e^{(4 - \frac{28}{157})m}\)。

**【注】** 这是把 Maynard-Tao 方法与张益唐/Polymath8a 的 MPZ 条件相结合的成果，首次给出了 \(m \ge 2\) 情形的无条件显式界。

---

## MPZ 下的抽象定理

设正数 \(\varpi, \delta < 1/4\) 满足 \(\mathrm{MPZ}[\varpi, \delta]\)。
对 \(\alpha > 0\)，定义 \(M_k^{[\alpha]} := \sup_F \rho(F)\)，上确界取遍支撑在 \([0,\alpha]^k \cap \mathcal{R}_k\) 的非零平方可积函数。

**定理 (D.H.J. Polymath 2014)**
若 \(\mathrm{MPZ}[\varpi, \delta]\) 成立，则只要
\[
M_k^{[1/(1/4 + \varpi)]} > \frac{m}{1/4 + \varpi},
\]
就有 \(\mathrm{DHL}[k, m+1]\)。

**例子**
\(H_2 \le 398130\) 的证明使用了一个可容许的 35410-元组，并验证了存在 \(\delta, \varpi > 0\) 满足 \(600\varpi + 180\delta < 7\) 使得
\[
M_{35410}^{[1/(1/4 + \varpi)]} > \frac{2}{1/4 + \varpi}.
\]

**【注】** 该定理将 Maynard 的 EH 版本无缝移植到 MPZ 条件之下，实现了两种突破方法的融合。

---

*（原报告结尾附有 Notices of the AMS 某一期的封面图片说明，此处略去。）*

<!-- 【待补全】此处略去了原报告末页的 Notices of the AMS 封面图/图注。作为转写稿可接受；若希望完整，可补一句注明该期刊期号/出处，或说明“封面图从略，不影响数学内容”。 -->
