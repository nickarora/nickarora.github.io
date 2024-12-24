---
title: "Toyota Kata by Mike Rother"
date: 2024-11-13
summary: A deep dive into the mindset and practices that allowed Toyota to succeed where others could not
tags:
- books
- leadership
- process
---

{%
  include progressive-image.html
  asset="toyota-kata"
  path="books"
  alt_text="Toyota Kata"
%}

In the early 2000s, Toyota separated itself from all other carmakers in ways other manufacturers could not fathom. It was an era of astounding growth, where annual increases in Toyota's production sometimes outpaced the _total_ output of its competitors (somehow without compromising quality).

When American manufacturers attempted to emulate Toyota, their results didn't come close. So what was Toyota's secret sauce?

To answer this question, Mike Rother spent six years observing some of the best Toyota Product System (TPS) masters work. His findings: Toyota's sustained competitive advantage had almost nothing to do with the specific techniques they were using on the factory line.

Rather, their success stemmed from a _mindset_ that permeated decision-making at every level of the organization. In his book _Toyota Kata_, Rother explains Toyota's philosophy and shares practical techniques to leverage their wisdom.

## The Secret: Scientific Thinking

The term “scientific thinking” might conjure images of lab coats and microscopes, but Rother describes it in a more practical, everyday sense. It’s a way of thinking that helps people achieve challenging goals _despite their natural biases_.

Try reading the following phrase:

<section class="toyota-kata-perception-example">
  <main class="censored-text">
    <p>IUMRING TQ GQNGIUSIQNS</p>
    <div class="censor" />
  </main>
  <div class="actions">
    <button type="button" class="small" onclick="toggleCensor()">
      Reveal
    </button>
  </div>
</section>

Were you able to read it before tapping reveal? Was your guess correct?

The way our brain fills in gaps shows how easily our perceptions can stray from reality. Scientific thinking counters this by intentionally coordinating what we _predict_ will happen with what _actually_ happens — and learning from the difference. It is a countermeasure to our cognitive biases.

Rother observed that Toyota's managers practice and teach a pattern of scientific thinking every day. The specific techniques employed on the shop floor were just byproducts of this practice.

By having all levels of the organization engaging in scientific thinking, Toyota was able to continuously improve and adapt while other manufacturers remained stagnant.

> The competitive advantage of an organization lies not so much in the solutions themselves—whether lean techniques, today’s profitable product, or any other—but in the ability of the organization to understand conditions and create fitting, smart solutions.

## Learning Via Kata

The term "kata" originates from martial arts, referring to movements that are repeatedly practiced to develop skills. Inspired by this idea, Rother offers two kata that can be used by organizations to develop their scientific thinking skills: the Improvement Kata and the Coaching Kata.

### Improvement Kata

The "Improvement Kata" is a structured routine for working toward a desired goal through experimentation and learning. It consists of four steps:

1. **Establish a vision**: Define a long-term, aspirational goal that guides the organization.
2. **Grasp the current condition**: Understand the current situation thoroughly before attempting changes.
3. **Establish the next target condition**: Set a short-term, achievable goal as a step toward the vision.
4. **Conduct experiments to reach the target condition**: Run small, iterative experiments to address obstacles and navigate uncertainty.

As you might imagine, achieving a target condition is not easy. There are unforeseable obstacles, problems, and issues that can only be discovered along the way. The antidote to this uncertainty is experimentation. Each experiment should be planned, executed, and reflected upon before the next step is decided (a "Plan-Do-Check-Act" cycle). By learning from the outcomes of these experiments, we become better and better positioned to achieve the target.

Importantly, steps 2 to 4 are to be repeated until the vision has been achieved. But there is a catch: a well crafted vision statement is _aspirational_. It may not be achievable in a single life time (if at all). Most organizations will end up repeating steps 2 to 4 indefinitely, part of a neverending quest for continuous improvement.

> There are perhaps only three things we can and need to know with certainty: where we are, where want to be, and and by what means we should maneuvre the unclear territory between here and there.

### The Coaching Kata

The Coaching Kata is a framework for leaders to teach scientific thinking to their teams. It involves asking targeted questions that guide mentees through the Improvement Kata, such as:

- What is your target condition?
- What is the current condition? How do you know?
- What obstacles might prevent you from reaching the target?
- What did you learn from your last experiment?
- What is your next step?

The goal is to help mentees develop the skills to solve problems independently. If leaders simply provide solutions, they undermine the learning process. This kata ensures scientific thinking spreads throughout the organization, fostering continuous improvement and preparing future leaders.

## Conclusion

Toyota Kata offers more than just a window into Toyota’s success—it’s a toolkit for anyone aiming to tackle challenges, adapt to change, and achieve ambitious goals. By focusing on mindset over tools, Rother provides a fresh perspective on what it means to improve. The Improvement and Coaching Kata are practical, repeatable frameworks that can be applied not only in business but in life.

<style>
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap');

  .toyota-kata-perception-example {
    display: inline-block;

    .censored-text {
      position: relative;
      font-size: var(--fs-4);
      font-weight: var(--fw-2);
      line-height: var(--lh-3);

      p {
        font-family: 'Noto Serif', serif;
        letter-spacing: 2px;
        white-space: nowrap;
      }

      .censor {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: calc(var(--fs-4) * var(--lh-3) * 0.48);
        backdrop-filter: blur(12px);

        &.hide {
          display: none;
        }
      }
    }

    .actions {
      display: flex;
      flex-direction: row;
      justify-content: flex-start;
      gap: 0.25rem;
      margin-top: 0.5rem;
    }
  }

  @media (width < 600px) {
    .toyota-kata-perception-example .censored-text {
      font-size: var(--fs-2);
      font-family: var(--ff-header);

      .censor {
        height: calc(var(--fs-2) * 1.75 * 0.5);
      }
    }
  }
</style>

<script>
  function toggleCensor() {
    const button = document.querySelector(".actions button")

    const censor = document.querySelector(".censor")
    const hidden = censor.classList.contains("hide")

    if (hidden) {
      censor.classList.remove("hide")
      button.textContent = "Reveal"
    } else {
      censor.classList.add("hide")
      button.textContent = "Hide"
    }
  }
</script>
