# prime cycles 质数循环

<!-- 【完成度】当前为素材草稿（fragment，约15%）：仅有一张猜想截图、一段 Python 代码、一行「233 循环」示例，缺全部文字说明与分析。下一步优先级：①文首用文字正式写出猜想与映射定义 f(n)=10p+(p mod 10)（p 为 n 的最大质因子）；②为代码补算法说明；③解读 233 循环并补上「有哪些循环/是否人人进环」的分析；④解决标题 lean4 与正文 Python 不符的问题。 -->
<!-- 【结构】标题/文件名含 lean4，但正文无任何 Lean4 代码，全是 Python。请二选一：要么把标题改为「质数循环（Python 实验）」之类，要么补写 Lean4 形式化小节。 -->

### guess:

<!-- 【待补全】此处「猜想」只用一张外链截图表示，公众号正文看不到文字、截图失效即丢失。请用文字正式陈述猜想，建议：定义 f(n)=10·p+(p mod 10)，其中 p 是 n 的最大质因子；猜想：对任意正整数 n，迭代 {n, f(n), f(f(n)), …} 最终进入一个循环。 -->
<!-- 【续写建议】写完猜想陈述后，加一段「规则直觉」：每一步先取最大质因子 p，再把 p 的个位补到末尾，所以结果总以重复数字结尾（如 233→2333）。再给一个最小例子手算演示，引出后面的代码。 --> 

![](https://files.mdnice.com/user/112960/6deba76d-9f71-47fe-8403-8399b28b6f37.png)

<!-- 【待补全】代码前缺算法说明。请补：core 规则在 get_next_number（取最大质因子→末位拼接）；为应对大数用 Miller–Rabin 判素 + Pollard's Rho 分解。并在代码后解释 trace_sequence 的输出（进环前路径 / 环本身 / 步数）。 -->

~~~python
import sys
import random
import math

sys.setrecursionlimit(10**6)      # For deep recursion if needed (unlikely)
sys.set_int_max_str_digits(0)     # Allow printing of huge numbers

# ---------- Miller–Rabin primality test ----------
def is_prime(n: int) -> bool:
    """Return True if n is prime, False otherwise."""
    if n < 2:
        return False
    # Small primes for quick divisibility checks
    small_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    for p in small_primes:
        if n % p == 0:
            return n == p

    # Write n-1 as d * 2^s
    d = n - 1
    s = 0
    while d % 2 == 0:
        d //= 2
        s += 1

    # Test with 12 random bases (enough for practical purposes)
    for _ in range(12):
        a = random.randrange(2, n - 1)
        x = pow(a, d, n)
        if x == 1 or x == n - 1:
            continue
        for _ in range(s - 1):
            x = (x * x) % n
            if x == n - 1:
                break
        else:
            return False
    return True

# ---------- Pollard's Rho factorisation ----------
def pollards_rho(n: int) -> int:
    """Return a non‑trivial factor of n (n is composite)."""
    if n % 2 == 0:
        return 2
    if n % 3 == 0:
        return 3

    while True:
        c = random.randrange(1, n - 1)
        f = lambda x: (pow(x, 2, n) + c) % n
        x = y = 2
        d = 1
        while d == 1:
            x = f(x)
            y = f(f(y))
            d = math.gcd(abs(x - y), n)
        if d != n:
            return d

def _factor(n: int, factors: list):
    """Recursively factor n and append prime factors to the list."""
    if n == 1:
        return
    if is_prime(n):
        factors.append(n)
        return
    d = pollards_rho(n)
    _factor(d, factors)
    _factor(n // d, factors)

def factor(n: int) -> list:
    """Return a list of all prime factors of n (with multiplicity)."""
    factors = []
    _factor(n, factors)
    return factors

# ---------- Largest prime factor ----------
def largest_prime_factor(n: int) -> int:
    """Return the largest prime factor of n. For n <= 1 returns 1."""
    if n <= 1:
        return 1

    lpf = 1
    # Remove all factors of 2
    while n % 2 == 0:
        lpf = 2
        n //= 2

    # Trial division by odd numbers up to 100 (quick win for small factors)
    p = 3
    while p * p <= n and p < 100:
        while n % p == 0:
            lpf = p
            n //= p
        p += 2

    if n == 1:
        return lpf

    # If the remainder is prime, it's the largest (or at least larger than lpf)
    if is_prime(n):
        return n

    # Otherwise factor the composite remainder and pick the largest prime
    remaining_factors = factor(n)
    largest = max(remaining_factors)
    return max(lpf, largest)

# ---------- Sequence generation (unchanged except using improved lpf) ----------
def get_next_number(n: int) -> int:
    lpf = largest_prime_factor(n)
    last_digit = lpf % 10
    return (lpf * 10) + last_digit

def trace_sequence(start_number: int):
    seen = []
    current = start_number

    print(f"Starting number: {current}")
    print("-" * 30)

    while current not in seen:
        seen.append(current)
        current = get_next_number(current)

    loop_start_index = seen.index(current)
    path_to_loop = seen[:loop_start_index]
    actual_loop = seen[loop_start_index:]

    print(f"Path before loop: {' -> '.join(map(str, path_to_loop))}")
    print(f"\nCaught in the loop: {' -> '.join(map(str, actual_loop))} -> {current}...")
    print(f"\nTotal steps to enter the loop: {len(path_to_loop)}")
    #print(f"Length of the loop: {len(actual_loop)}")

# ---------- Main ----------
if __name__ == "__main__":
    while True:
        try:
            test_number = int(input("Enter a starting number (or 0 to exit): "))
            if test_number == 0:
                break
            trace_sequence(test_number)
        except ValueError:
            print("Please enter a valid integer.")

    
~~~
[Gemini chat 1](https://gemini.google.com/app/3bd064b59c7710c2)

<!-- 【待补全】这是写作过程残留的私人 Gemini 会话链接，他人无法访问，正式发布前请删除或替换为可公开引用的来源。 -->

### THE "233 LOOP":

<!-- 【待补全】只给了数列没有解读。请补文字：从 233 出发迭代后回到 233，整条链本身就是一个循环（首项即环入口）。说明循环周期，并指出关键转折点 233333 不是质数（233333=661×353，最大质因子为 661，故下一项为 6611）。 --> 
>233 -> 2333->23333-233333-6611-6011--60111-66799-9977-9077-3133-2411-24111-477-533-411-1377-177-599-5999-8577-9533-95333-136199-194577-8211-233

<!-- 【核对】数值经复算无误（与本行完全一致），但分隔符混乱：箭头写法不统一（有的用空格包裹、有的紧贴、个别处连写了两个连字符）。建议统一为「→」。规范写法：233 → 2333 → 23333 → 233333 → 6611 → 6011 → 60111 → 66799 → 9977 → 9077 → 3133 → 2411 → 24111 → 477 → 533 → 411 → 1377 → 177 → 599 → 5999 → 8577 → 9533 → 95333 → 136199 → 194577 → 8211 → 233。 -->
<!-- 【续写建议】此处结尾戛然而止。建议在此后补「分析」小节：用代码批量扫描小整数，统计共出现几种不同循环（吸引子）、各自的周期、有无不动点、进入循环前的最大步数，并附一张吸引子/步数分布图，把素材升级为完整文章。 -->