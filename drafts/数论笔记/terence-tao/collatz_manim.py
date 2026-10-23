from manim import *


class CollatzOrbit(Scene):
    """Show the full 17-orbit and the odd-only Syracuse compression."""

    def construct(self):
        values = [17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
        syracuse_values = [17, 13, 5, 1]
        valuations = [2, 3, 4]

        title = Text("Collatz orbit from N = 17", font_size=30).to_edge(UP)
        axes = Axes(
            x_range=[0, 12, 2],
            y_range=[0, 60, 10],
            x_length=10,
            y_length=4.0,
            tips=False,
            axis_config={"include_numbers": True, "font_size": 18},
        ).shift(UP * 0.25)
        axis_labels = axes.get_axis_labels(
            x_label=MathTex("n"),
            y_label=MathTex("value"),
        )

        points = [axes.c2p(index, value) for index, value in enumerate(values)]
        orbit_line = VMobject(color=BLUE).set_points_as_corners(points)
        dots = VGroup(*[Dot(point, radius=0.06, color=BLUE) for point in points])
        marked_indices = [1, 3, 7, 12]
        value_labels = VGroup(
            *[
                MathTex(str(values[index])).scale(0.6).next_to(
                    dots[index], UP, buff=0.08
                )
                for index in marked_indices
            ]
        )

        self.play(Write(title), Create(axes), Write(axis_labels))
        self.play(Create(orbit_line))
        self.play(
            LaggedStart(
                *[GrowFromCenter(dot) for dot in dots],
                lag_ratio=0.08,
            )
        )
        self.play(FadeIn(value_labels))

        syracuse_row = VGroup(
            *[MathTex(str(value)).scale(0.8) for value in syracuse_values]
        ).arrange(RIGHT, buff=1.25).shift(DOWN * 3.0)
        syracuse_title = Text(
            "Syracuse: keep only odd values",
            font_size=24,
        ).next_to(syracuse_row, UP, buff=0.16)

        arrows = VGroup()
        arrow_labels = VGroup()
        for index, valuation in enumerate(valuations):
            arrow = Arrow(
                syracuse_row[index].get_right(),
                syracuse_row[index + 1].get_left(),
                buff=0.12,
                stroke_width=2,
                max_tip_length_to_length_ratio=0.2,
            )
            label = MathTex(f"a_{index + 1}={valuation}").scale(0.52)
            label.next_to(arrow, UP, buff=0.05)
            arrows.add(arrow)
            arrow_labels.add(label)

        self.play(Write(syracuse_title), FadeIn(syracuse_row))
        self.play(Create(arrows), FadeIn(arrow_labels), run_time=1.6)
        self.wait(2)
