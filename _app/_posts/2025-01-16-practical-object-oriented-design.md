---
title: "Practical Object Oriented Design by Sandi Metz"
date: 2025-01-16
summary: Understand how object oriented design keeps software understandable, maintainable, and flexible
tags:
- books
- software design
---

{%
 include progressive-image.html
 asset="poodr"
 path="books"
 alt_text="Practical Object Oriented Design"
%}

After spending enough time in the software industry, developers come to embrace a single, enduring truth: most applications are a complete mess. It doesn’t always start that way. Many successful businesses are built on the backs of perfectly acceptable code.

However, as time ticks on, that software endures a constant barrage of new requirements, feature requests, and bug fixes. These changes are often implemented under time pressure. Developers add hack after hack, and the software becomes harder and harder to change. The code calcifies - it’s rigid, brittle, immobile.

> The problem with poorly designed small applications is that if they are successful, they grow up to be poorly designed big applications.

## The Problem

Developers absolutely hate working on applications like this. But their distaste is not the real problem. The _real_ problem is that the time and cost necessary to change the application have considerably increased. When a business has a hard time responding to changing market conditions, it can fail outright.

This paints a dire picture. Thankfully, Sandi Metz’s book, _Practical Object Oriented Design_, demonstrates how this bleak future can be avoided. The trick is learning to _design_ code so it remains _easy to change_.

> The purpose of design is to allow you to do design later, and it's primary goal is to reduce the cost of change.

## An Object-Oriented Approach

When developers first learn to write code, they start by writing _procedurally_. It comes naturally. The developer writes a list of steps. The computer executes them in sequential order. For simple applications, this can often be the best solution.

However, as the complexity of the application increases, the problems with procedural code start to surface. What was once a simple list of steps has transformed into a complicated, condition-laden, duplicative knot that is hard to understand and almost impossible to change.

An object-oriented (“OO”) approach offers a countermeasure to this problem. With OO, the code is organized into small, interchangeable units (objects) that collaborate by sending messages to one another. This offers several benefits:

- **Code can be reused.** Rather than rewriting a procedure, just send a message to an existing object.

- **Easier comprehension.** Developers can focus on the object they’re changing and ignore the details of other objects.

- **Substitutability.** If a new object responds to the same messages, it can stand in for an old one with minimal fuss.

However, it is important to note that OO is not a silver bullet. When used correctly, complex applications become easier to understand and change. But in the wrong hands, OO can be just as convoluted, calcified, and frustrating to change as a procedural code itself. This is why it is so important to study object-oriented design.

## Object Oriented Design

Good design ensures code is arranged so that it is changeable in the face of unpredictable requirements. Designing for changeability is all about carefully managing dependencies.

A dependency is created any time one object collaborates with another object. They are a necessity as soon as your application starts doing anything relatively complex. The problem with dependencies is that when they change, things that depend on them may _also have to change_. In the worst case, even the smallest change can cause a cascade of failures through the codebase.

To tackle this, Sandi Metz prescribes several battle-tested strategies:

- **Create high cohesion objects.** An object is highly cohesive when everything inside it is related to its central purpose. Designing a class in this way ensures it is easy to reuse and less likely to be entangled with other code.

> A class should do the smallest possible useful thing; that is, it should have a single responsibility.

- **Design flexible interfaces.** The messages between objects matter more than the objects themselves. Tell an object "what" you want done, not "how" to do it. This frees you to alter internal implementations without affecting everything else.

> Design experts notice domain objects without concentrating on them; they focus not on these objects but on the messages that pass between them

- **Carefully choose dependency direction.** Some objects change more often than others. By making sure objects depend on those less likely to change, you can minimize disruption.

> The choices you make about the direction of dependencies have far reaching consequences that manifest themselves for the life of your application. ...if you get it wrong then the dependencies will gradually take over and the application will become harder and harder to change

- **Change behavior by leveraging dependency injection.** Despite the lofty name, dependency injection is a relatively simple concept. Instead of creating dependencies within your object, push them in from the outside. This means your object no longer depends on some _specific_ class or implementation. Any object that implements the required interface can be pushed in. This makes it straightforward to substitute alternative implementations.

> You don't send messages because you have objects, you have objects because you send messages.

- **Prefer composition over inheritance.** With inheritance, code is shared through method delegation to a parent class (or mix-in). Though it can sometimes be useful, it comes with significant risk. Inheritance structures are inherently inflexible. As soon as one of the “children” deviates from the others, the entire implementation must be reevaluated. The safer approach is to share code through composition.

> Composition contains far fewer built-in dependencies than inheritance; it is very often the best choice.

- **Write high value tests.** The most common reasons used to justify writing tests are that they reduce bugs and provide documentation. These reasons, while valid, belie a more critical goal. Well written tests reduce the cost of change. They provide an environment where an object's design can be evaluated and they enable developers to safely modify an implementation.

> Tests are your record of the interface of every abstraction and as such they are the wall at your back. They let you put off design decisions and create abstractions to any useful depth.

## Conclusion

In recent years, OO design has received increasing criticism. Developers argue that it becomes bloated with complex class hierarchies and that alternative approaches (like functional programming) are easier to maintain. Sandi Metz reminds us that, when done thoughtfully, OO design remains a powerful way to keep software understandable, maintainable, and, crucially, easy to change.
