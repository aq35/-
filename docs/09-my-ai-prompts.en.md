# 9 (EN). My AI Prompts — English version (copy & paste)

English version of [9. 私用の AI 指示文](09-my-ai-prompts.md). The numbering is the same, so you can switch between the two.

- Each prompt is **one code block**. Copy it with the button at the top right, and replace only the `<...>` parts.
- This file contains the prompts only. For the helper commands (`gh`, `rg`, `git worktree`, ...), the table of commonly misunderstood words, and the flow diagram, see the [Japanese version](09-my-ai-prompts.md).
- The prompts say "Answer in Japanese." Change it to "Answer in English." if you want English answers.

## Contents

| # | When to use it | Output |
|---|---|---|
| [0](#0-common-rules-paste-first-every-time) | Common rules (paste first, every time) | — |
| [1](#1-development-policy-from-merged-pr-reviews) | Organize the development policy from review comments of merged PRs | `docs/policy/development-policy.md` |
| [2](#2-investigate-the-spec-from-the-implementation) | Investigate the spec from the implementation (code) | `docs/spec/<feature>.md` |
| [3](#3-investigate-the-spec-from-the-design-document) | Investigate the spec from the current design document | `docs/spec/<feature>-design.md` |
| [4](#4-turn-what-i-want-to-do-into-a-spec) | Turn what I want to do this time into a spec | `docs/spec/<feature>-next.md` |
| [5](#5-find-everything-related-to-this-change) | Find everything related to this change (missed fields) | A table (in the chat) |
| [6](#6-write-the-test-code) | Write tests based on what I want to do | Test code |
| [7](#7-run-the-formatter-linter-and-tests) | Run the formatter, linter, and tests, and fix | A result table |
| [8](#8-proposal-find-differences-between-design-and-implementation) | **Proposal** Find differences between design and implementation | `docs/spec/<feature>-diff.md` |
| [9](#9-proposal-pre-review-against-the-development-policy) | **Proposal** Pre-review the diff against the development policy | A list of findings |
| [10](#10-proposal-self-check-before-finishing) | **Proposal** Check for out-of-scope changes before finishing | Check results |
| [11](#11-proposal-resume-a-long-task) | **Proposal** Resume a long task later | A summary |

---

## 0. Common rules (paste first, every time)

```text
[Common rules]
- Answer in Japanese.
- Separate facts (things you confirmed in the code or documents) from guesses. Write "unknown" for anything you could not confirm.
- Give evidence as file paths and line numbers.
- Do not make any change that I did not ask for.
- Do not do any of the following until I tell you to: commit, push, delete branches or tags, force-push, rewrite history, operate on the production environment, read secrets.
- Keep going on the parts you can. Do not guess when something is unclear; collect your questions and ask them at the end.

[Project assumptions]
- Language: <Go / Rust, etc.>
- The GraphQL schema is in schema/ (a git submodule). Do not change any file inside schema/.
- A formatter, a linter, and test commands always exist. If you do not know them, find them (see 7).
```

---

## 1. Development policy from merged PR reviews

```text
Investigate the past pull requests of this repository, and organize its "development policy" from the review comments, in Markdown. Do not modify any code.

[Scope]
- Repository: <owner/repo>
- Only merged PRs. PRs that were closed without being merged are out of scope.
- Period / count: <e.g. last 6 months / last 50 PRs>

[What counts as an "adopted" review comment]
A comment counts as "adopted" only if it meets one of these:
1. It is followed by a commit that makes the change the comment asked for.
2. Its thread is Resolved, and a reply agrees to make the change.
Put comments that meet neither into a separate group: "not adopted / unknown".

[How to investigate]
- Use the gh command to fetch the PR list, the review comments, and the commits made after each comment.
- If you cannot fetch them, say so and ask me how to get the data.

[How to organize]
- Merge comments with the same intent into one policy.
- For each policy, write:
  - The policy (one sentence, in the form "do X" or "do not do X")
  - The reason (what was said in the review)
  - A good example / a bad example (keep code excerpts short)
  - Evidence (PR numbers and comment URLs; all of them if there are several)
  - Frequency (in how many PRs it was raised)
- A comment raised in only one PR is not a policy. Put it in "one-off comments".
- Separate what the comments said (facts) from your own interpretation.

[Output]
- File: docs/policy/development-policy.md
- Structure: Summary / Policies (most frequent first) / One-off comments / Comments not adopted / Scope and method of the investigation
```

---

## 2. Investigate the spec from the implementation

```text
Read the implementation (code) and investigate the spec of <target feature / module>. Write it in Markdown.

[Premise]
- The source of truth for the spec is "what the code does now". Do not use design documents or PR descriptions for this task.
- Do not modify any code.

[What to investigate]
- Purpose (what the feature is for, as far as the code shows)
- Input (arguments, requests, types, constraints, default values)
- Output (return values, responses, types)
- Flow (in call order; name the functions and files)
- Branches and errors (under which condition which error is returned)
- Side effects (DB updates, external API calls, logs, cache)
- Implicit constraints (authorization, ordering, upper limits, timeouts, retries)

[How to write]
- Attach evidence to every item: file path and line number.
- Write what the code shows as "fact". Write what the code cannot tell you (intent, background) as "unknown". Do not fill gaps with guesses.
- Put suspicious points (possible bugs, comments that disagree with the code) in a separate section, "Points of concern", apart from the spec.

[Output]
- File: docs/spec/<feature>.md
```

---

## 3. Investigate the spec from the design document

```text
Read the current design document and organize the spec of <target feature> in Markdown.

[Design document]
- <path or URL, e.g. docs/design/xxx.md>
- If it is not specified or not found, look in docs/ and elsewhere, and tell me which document you read.

[Premise]
- Organize only what the design document says. Do not read the code (comparing with the code is a separate task).
- Do not modify any code.

[What to organize]
- Purpose / Input / Output / Flow / Errors / Constraints / Non-functional requirements (performance, availability, security)

[How to write]
- For each item, say which section of the design document it comes from.
- List contradictory, vague, and undecided (TBD) points in the design document as "Needs confirmation".
- If you can tell the last-updated date or version of the document, write it (to judge whether it may be outdated).

[Output]
- File: docs/spec/<feature>-design.md
```

---

## 4. Turn what I want to do into a spec

```text
Organize what I want to do into a spec. Do not modify any code.

[What I want to do]
<Write freely here. Bullet points are fine.>

[Rules]
- Do not add anything to the spec that I did not write. Put things you want to add in the "Proposals" section.
- If something is ambiguous, do not decide it in the spec. Write it as a question in "Questions".
- If you need to know the current spec, you may read the related code and design documents. Tell me what you read.

[Structure of the spec]
1. Purpose
2. Scope (what to do / what not to do)
3. Input and output (types, constraints, examples)
4. Behavior (normal cases / error cases / boundary values)
5. Acceptance criteria (written so that they can be turned into tests: "when X, then Y")
6. Impact on existing behavior (what changes / what must not change)
7. Questions
8. Proposals (things I did not write, but you think would be good to have)

[Output]
- File: docs/spec/<feature>-next.md
- When you finish, show me only the "Questions" and wait for my answers.
```

---

## 5. Find everything related to this change

```text
Find everything related to this change and list it. Do not modify any code.

[This change]
<e.g. Add email (optional) to User>
(If the change is already made, use "the changes on the current branch = git diff origin/main...HEAD".)

[Meaning of the words]
- "Attribute" means a data item (a field of a struct). It does not mean a language attribute (such as Rust's #[...]) or a tag (such as Go's struct tags).

[What to look for]
1. Places that use the same type, function, or constant (callers, usages)
2. Missed field additions
   - When a field is added to a struct, the same field must also be added to the other implementations that use the same struct.
   - Look in these two ways:
     a. Implementations that use the same struct name
     b. Types whose name differs but whose fields are similar (for example: source/target types of a conversion, response types of an API, types that represent a DB row, GraphQL types, types used in tests). Use matching or similar field names as clues, including differences between snake_case and camelCase.
   - For each type you find, decide whether the field must be added, and give the reason. Mark it "needs confirmation" if you cannot decide.
3. Settings attached to the item (tags / attributes such as JSON names, serialization settings, validation, default values)
4. Conversion code (type conversion functions, mappers, hand-written copying code)
5. The GraphQL schema (schema/), DB migrations, tests, documents, configuration files

[Output]
Use this table:
| Location (path:line) | Type / function | Kind (same name / similar / caller / conversion / test / document) | Action (needed / not needed / needs confirmation) | Reason |
- For items found as "similar", write why you judged them similar (which field names matched).
- At the end, report what you checked in places that are hard to find by search (reflection, macros, generated code, fields referenced by string).
```

---

## 6. Write the test code

```text
Write test code based on what I want to do this time.

[What I want to do]
<The path of the spec file (e.g. docs/spec/xxx-next.md), or write it directly here>

[What you may change]
- Test code only (test files, or the test part inside the same file).
- Do not change the non-test part (production code) by even one line.
- Do not change existing tests (add only).

[Write two kinds of tests]
A. Tests for the new spec
- They check the behavior in the spec. It is not implemented yet, so it is correct for them to fail when run.
- Even if they fail, do not fix the production code to make them pass. Only confirm that the reason for the failure is "not implemented yet".
- Mark each test as not implemented: use the exact text "未実装: <spec item name>" as the reason when skipping the test (keep the Japanese text so that it can be found later with the same search command).
B. Tests that protect existing behavior (regression check)
- They check how the current production code behaves. They must pass with the current code.
- Cover the behavior that must not change, in the places this change is likely to affect.

[How to proceed]
1. First, run all existing tests and record the result (to tell apart tests that were already failing).
2. Before writing tests, show me the list of tests you will write (A and B), and wait for my OK.
3. After writing them, run all tests and report the result separately for A and B.
   - Expected: A fails (or is skipped), B passes. If a result differs from this, explain why.
4. At the end, show with git diff that you did not change the production code.

[Rules for writing]
- Follow the location and style of the existing tests.
- Give each test a name that says what it checks.
- Include normal cases, boundary values (zero items, empty, maximum), and error cases.
- Do not weaken expected values or delete tests to make them pass.
```

---

## 7. Run the formatter, linter, and tests

```text
Run the formatter, the linter, and the tests, and report the results.

[How to find the commands]
Find this project's commands in this order. When you find them, tell me which file they were in.
1. Commands written in the CI configuration (e.g. .github/workflows/, buildspec/, the pipeline definition) ← treat this as the source of truth
2. Task runners and documents: justfile, Makefile, scripts in package.json, CLAUDE.md, README, CONTRIBUTING
3. If neither has them, the standard commands of the language
If the CI and a local setup use different commands, use the CI ones.

[Steps]
1. Before the changes (the baseline state), run the three and record the results.
   - If changes are already made, do not touch my working directory. Create the pre-change state in another place and run it there:
     git worktree add ../baseline origin/main
     (if there is a submodule, also run git -C ../baseline submodule update --init; when done, remove it with git worktree remove ../baseline)
2. After the changes, run the same three.
3. Handle failures by these rules:
   - Failures caused by this change (those that passed in the baseline): fix them.
   - Failures that were already there in the baseline: do not fix them. List them in the report.
   - Formatter findings: you may fix them with the automatic formatter. But if files unrelated to this change get reformatted, revert those files and tell me.
4. After fixing, run the three again and report the results.

[Do not]
- Silence lint warnings by disabling them
- Delete tests, skip tests, or rewrite expected values
- Lower the strictness of a command to make it pass (for example, removing the option that turns warnings into errors)
If you think one of these is necessary, do not do it. Explain why and ask me.

[Report]
Use this table:
| Kind (formatter / linter / tests) | Command run | Baseline | After changes | Notes (what you fixed, failures that were already there) |
```

---

## 8. Proposal: find differences between design and implementation

```text
For the same feature, compare the spec made from the design document with the spec made from the implementation, and list the differences. Do not modify any code or documents.

[What to compare]
- From the design document: docs/spec/<feature>-design.md
- From the implementation: docs/spec/<feature>.md

[Output]
- File: docs/spec/<feature>-diff.md
- Use this table:
| Item | Design document says | Implementation does | Verdict (match / differs / only on one side) | Evidence (section of the design document, path and line of the code) |
- For "differs" and "only on one side", write which side seems outdated in a "My view" column. Do not state it as certain.
- At the end, list separately the points where the design document probably needs fixing and the points where the code needs checking.
```

---

## 9. Proposal: pre-review against the development policy

```text
Review the changes on the current branch against the development policy. Do not modify any code.

[Target]
- Changes: git diff origin/main...HEAD
- Development policy: docs/policy/development-policy.md

[Request]
- For each policy item, judge whether this change "follows it / breaks it / is not related".
- For "breaks it", give the path and line of the code, the policy item, and a suggested fix.
- If you find issues that are not in the policy (bugs, boundary conditions, error handling), put them in a separate section.
- If there is no problem, write "No issues". Do not invent findings.
```

---

## 10. Proposal: self-check before finishing

```text
Before finishing, check whether the changes stay within the scope of the request. Do not modify any code.

[What to check]
1. Show the list of changed files with git status and git diff --stat.
2. Check for changes unrelated to the request (formatting-only changes, unrelated files, generated files, configuration files, changes to the commit a submodule points to).
3. Check for leftovers (debug output, temporary commented-out code, TODOs, skipped tests, secrets).
4. Check whether anything I asked for has not been done.
5. Check that the quality check in 7 (formatter, linter, tests) is all passing.

[Output]
Mark each check as "OK / needs action". For "needs action", give the file and line.
```

---

## 11. Proposal: resume a long task

```text
Summarize the work so far in the following form. I will use it to resume the work in a new conversation.

- Goal (what we are trying to achieve)
- Decisions made (specs, policies, judgments, and the reasons)
- What was done (files changed, commands run and their results)
- What is not done yet (the next steps, in order)
- Open issues, questions, risks
- Unconfirmed assumptions (parts where we proceeded on a guess)

Separate facts from guesses.
```

---

## Appendix: an example `CLAUDE.md` (so you do not paste the common rules every time)

Put it as `CLAUDE.md` at the repository root. Claude Code reads it automatically every time.

```markdown
# Working rules

## General
- Answer in Japanese.
- Separate facts from guesses. Write "unknown" for what you could not confirm.
- Give evidence as file paths and line numbers.
- Do not make changes that were not requested.
- Do not do these until told to: commit, push, delete branches or tags, force-push, rewrite history, operate on production, read secrets.

## This project
- Language: <Go / Rust, etc.>
- The GraphQL schema is in schema/ (a git submodule). Do not change anything inside schema/.
- Formatter, linter, and test commands: <e.g. fmt / lint / test in the justfile>. Use the same ones as the CI.

## After a change
- Run the formatter, the linter, and the tests, and report the results.
- Fix failures caused by your own change. Do not fix failures that were already there; report them.
- Do not disable lint rules, and do not delete or skip tests or rewrite their expected values.
```
