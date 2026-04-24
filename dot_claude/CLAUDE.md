# Global Instructions

## Code Style
- Always prefer discriminated unions over other union patterns where applicable
- Do not give parameters underscored prefixes (e.g., `_unused`) when the argument or param is unused
- Never use type casting (e.g., `as`, `as unknown as`, type assertions) without explicit permission
- Do not add backwards compatibility handling unless explicitly instructed to do so
- Use multi-line conditionals — do not put the body on the same line as the condition

```ts
// Bad
if (condition) doSomething();

// Good
if (condition) {
  doSomething();
}
```
