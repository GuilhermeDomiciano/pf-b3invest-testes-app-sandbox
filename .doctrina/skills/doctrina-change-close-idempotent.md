---
name: doctrina-change-close-idempotent
description: Evitar reaplicar ops de delta (append-criterion / bump-version) ao rodar doctrina close depois de um apply já feito.
when: O agente vai rodar doctrina close ou change apply pela segunda vez na mesma change, ou critérios de aceitação aparecem duplicados nas specs.
---

# Skill — doctrina-change-close-idempotent

## When to use this skill

- Antes de `doctrina close <id>` se `doctrina change apply <id>` já rodou com sucesso.
- Quando `coverage` ou a spec mostram critérios duplicados após um close parcial.
- Sempre que o playbook mandar apply → archive e o apply já foi executado manualmente.

## Procedure

1. Conferir se os deltas já foram aplicados (`proposal` Status applied / critérios novos na spec).
2. **Antes do close/re-apply**, editar cada `specs/*/delta.md`:
   - Remover `append-criterion`, `bump-version` e qualquer op não idempotente.
   - Manter no máximo `set-header` idempotente, ou deixar só comentário “já aplicado”.
3. Remover critérios duplicados na spec alvo (manter uma linha por evidência).
4. Marcar **todas** as tasks e closing steps em `tasks.md` (incluindo archive/validate) — o archive recusa unchecked.
5. Rodar `doctrina close <id>` (ou `change archive` + `validate` se o close parou no meio).
6. Se o close parou no archive: corrigir tasks → `doctrina change archive <id>` → `doctrina validate`.

## Anti-patterns

- Rodar `doctrina close` com deltas que ainda têm `append-criterion` depois do primeiro apply.
- Usar `--force` no archive para “passar” sem remover duplicatas na spec.
- Assumir que `bump-version` no re-apply é inofensivo (gera 0.2 → 0.3 → 0.4 sem necessidade).

## Related material

- Change `0001-dotenv-secrets` (lição: close reaplicou append e duplicou critérios)
- `doctrina change apply|archive|close`
