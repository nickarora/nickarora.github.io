---
title: "User Stories Applied by Mike Cohn"
date: 2025-06-14
summary: Explore how user stories improve collaboration, clarity, and adaptability in agile software development
tags:
- books
- process
---

{%
 include progressive-image.html
 asset="user-stories-applied"
 path="books"
 alt_text="User Stories Applied"
%}

How exactly do product development teams decide what to do?

At its core, this is a communication problem. Those who need the software must effectively communicate with those building it.

When communication is clear, resources are well-allocated, releases go smoothly, and software aligns with customer needs. When things _don't go well_, we get unrealistic deadlines, misunderstandings, and products that fail to meet customer needs.

How can we avoid these common pitfalls?

Mike Cohn addresses this question in his influential book, _User Stories Applied: For Agile Software Development_.

## The Traditional Approach

The traditional way of solving this problem is by specifying an exhaustive list of “requirements.”  In practice this means writing lengthy, complex, implementation-focused descriptions of how a system should work:

<div class="example">
  <header>Requirements</header>
  <p>The system supports password resets using SendGrid</p>
  <p>The system allows users to save up to three unique credit cards in a relational database</p>
  <p>+1000 other requirements...</p>
</div>

At first, detailed requirements may seem beneficial.

Wouldn't they help clarify features, control costs, and enhance predictability? Wouldn't it be nice to have a fully formulated plan guiding product development decisions?

Cohn identifies several problems with this traditional approach.

### Requirements can be incorrect

Requirements written in advance are based on assumptions, which may later prove false. They may be written with the wrong target audience in mind or fail to consider technical constraints. The result: wasted time and effort.

Even worse, teams might rigidly adhere to the initial set of requirements, ignoring better solutions that emerge later. This rigidity risks delivering products that miss customer needs entirely.

### Requirements can be misleading

Lengthy written requirements often seem comprehensive and complete, but this is an illusion. It's impossible to anticipate and write down every decision in advance. Once the work begins in earnest, the deficiencies in the requirements are unearthed.

Making matters worse, written words are surprisingly imprecise. There’s no guarantee that two individuals will interpret a written statement in the same way.

Consider the requirement: "Each lunch order must include a choice of soup or salad and bread."

Does this mean lunch orders will include:
<ul class="example-misleading-requirements">
  <li>Soup or (salad and bread)?</li>
  <li>(Soup or salad) and bread?</li>
</ul>

### Requirements are hard to estimate

Requirements, by their nature, are compound and contain many details. Consequently, it becomes difficult to know _when_ they will be done. The longer the list of requirements,  the greater the uncertainty.

### Requirements are difficult for everyone to understand

Detailed requirements typically contain technical jargon, making them inaccessible to non-technical team members. This limits their use for effective collaboration.

So what other option is there?

## An Alternative: User Stories

One of the many fruitful practices that emerged out of the Chrysler [C3 project](https://en.wikipedia.org/wiki/Chrysler_Comprehensive_Compensation_System) was the use of _user stories_. User stories are minimal, natural language descriptions of features, written from a user's perspective.

<div class="example">
  <p>As a customer, I can regain access to my account when I forget my password</p>
</div>

<div class="example">
  <p>As a frequent flyer, I don't have to re-enter payment details each time I book a flight</p>
</div>

This simple shift in perspective provides significant benefits:

### User Stories Force Conversation

Unlike requirements, user stories make no attempt to detail precisely what must be built. User stories are, in fact, just _placeholders for a future conversation_.

Before the work can begin, a shared understanding of what is needed must be worked out in a conversation between the customer, the development team, and business representatives. These discussions clarify understanding, resolve ambiguities, and prevent wasted effort.

### User Stories Encourage Deferring Decisions

Deferring commitment is a well-known practice used by agile teams. The idea is to wait until the last responsible moment to make a critical decision.

This is not an elaborate form of procrastination; It’s a fundamental risk avoidance strategy. By waiting, the team maximizes available information before committing to a direction.

For this reason, user stories are written in terms of _goals_ rather than solutions. By waiting until the work begins to discuss an specific solutions and acceptance criteria, the team is more likely to get things right.

### User Stories Simplify Estimation and Prioritization

Each user story represents a single, independent, relatively small unit of work. If a story is too large, teams are encouraged to split it into smaller parts. As a result, estimation and prioritization of stories is manageable.

### User Stories Are Accessible to All Team Members

User stories intentionally use everyday language, ensuring all stakeholders (customers, developers, product teams, marketers) clearly understand them.

Not only does this approach ensure the team is aligned, it empowers all stakeholders to take an active role in shaping the software's development. Customers are not relegated to testing the software _after_ it is built; they can write stories, help determine their priority, and provide early feedback on proposed solutions.

## Writing Effective User Stories

Not all user stories are alike. Writing effective user stories requires a thoughtful approach. Good user stories exhibit the following qualities:

### Valuable

User stories should be valuable to the purchasers or users of the system. If the planned work is not valuable to this audience, then it puts the business at risk of losing sales.

Cohn suggests including three essential elements in every user story:

1. **Who wants the functionality**. The user or purchaser of a typical product or system. Rather than referring to these individuals generally, it is often beneficial to be specific about the role the person is playing (e.g. "job seekers" or "employers").

2. **What it is they want**. The thing that is desired or needed. It should be framed as a goal while remaining agnostic as to how that goal is achieved.

3. **Why they want it**. An explanation of why the individual wants the functionality. This is provided to help the team decide how best to solve the problem when the work begins.

In the book, Cohn suggests a template which captures all three elements:

<div class="example">
  <p>As a (role), I want (function) so that (benefit)</p>
</div>

### Written By The Right People

Ideally, customers write user stories. The customer is in the best position to know what problems they'd like solved. If customers aren't available, a representative from the business who deeply understands the users' needs _may_ serve as a proxy.

It is important to note that user proxies are risky. The proxy may unconsciously introduce personal biases. For example, the customer support team might prioritize features that reduce the number of support requests. Developers may downplay user issues in order to prioritize adopting a new technology. Those writing stories should strive to be as objective as possible.

> The best way to ensure that each story is valuable to the customer or users is
to have the customer write the stories.

### Written For The Right Audience

User stories must be written in a common language that is understood by all stakeholders. If business stakeholders dominate, stories might become too vague. If developers dominate, excessive technical jargon can obscure meaning. The goal is to create crystal-clear, shared understanding.

### Independent

Care should be taken to avoid introducing dependencies between stories. Dependencies between stories lead to prioritization and planning problems. Consider the following user stories:

<div class="example">
  <p>As a customer, I can pay with my Visa credit card</p>
</div>

<div class="example">
  <p>As a customer, I can pay with my MasterCard credit card</p>
</div>

The developers believe it will take three days to add support for the first credit card. Each additional credit card is trivial.

This creates a dilemma: which user story should be given the three day estimate? Visa or MasterCard? We can do better by recognizing they are dependent and combining them.

<div class="example">
  <p>As a customer, I can pay by credit card</p>
</div>

### Negotiable

Stories must remain negotiable. They are _not_ written contracts describing functionality that the
developers _must_ implement. Stories should be written with an understanding that the precise solution to the problem will be negotiated through _conversation_ when the work begins.

> Because story cards are reminders to have a conversation rather than fully detailed requirements themselves, they do not need to include all relevant details.

### Right Sized

Story size matters.

When user stories are too large, they can be difficult to estimate and prioritize. Teams should break these down into smaller, manageable pieces.

When user stories are too small, its an indication that the solution has been embedded into the stories. Teams should combine too-small stories into a single story that reflects their overarching goal.

> Like Goldilocks in search of a comfortable bed, some stories can be too big,
some can be too small, and some can be just right.

## Testable

Stories must be written in such a way that they can be tested. Consider the following:

<div class="example">
  <p>As a user, I never have to wait too long for any screen to appear</p>
</div>

This story is not easily tested because it contains the word "never" and because it does not define what "too long" means. How would someone verify that this story is complete?

## Limits of User Stories

While user stories offer significant benefits, they aren't universally applicable. Certain aspects, like system constraints (e.g. "handle 50,000 concurrent users"), are better documented separately. As with any agile practice, use user stories where they add clear value.

## Conclusion

Adopting user stories can significantly enhance communication, clarity, and adaptability within agile teams. By shifting from rigid, detailed requirements to concise, user-focused stories, teams improve their ability to collaborate and build valuable software. User stories aren’t a silver bullet but, applied thoughtfully, they provide a powerful foundation for successful agile software development.

<style>
  .example {
    background-color: white;
    color: black;
    max-width: 55ch;
    padding: 1rem;
    border-radius: 0.25rem;
    box-shadow: light-dark(#aaa, #1a1a1a) 0.125rem 0.125rem 0.5rem;
  }

  .example header {
    font-weight: bold;
    margin-bottom: 1rem;
  }

  .example p {
    font-style: italic;
    line-height: 1;
  }

  .example p + p {
    margin-top: 1rem;
  }

  .example-misleading-requirements {
    margin-top: 0;
  }
</style>
