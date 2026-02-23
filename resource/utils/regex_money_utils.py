import re

def extrair_valor_monetario(texto):
    import re
    texto = texto.replace('\xa0', ' ')
    # Sempre retorna uma lista, mesmo que só com um valor ou vazia
    return re.findall(r'R\$\s*([\d\.,]+)', texto, re.DOTALL)

def is_valor_monetario(texto):
    if not texto or not isinstance(texto, str):
        return 0
    texto_limpo = texto.replace('\xa0', ' ').replace('\n', ' ').strip()
    padrao_monetario = r'R\$\s*[0-9]{1,3}(?:\.[0-9]{3})*(?:,[0-9]{2})?'
    if re.search(padrao_monetario, texto_limpo):
        return 1
    else:
        return 0

# Teste da função is_valor_monetario com diferentes cenários
casos_teste = [
    '0.18%\nR$ 212.281.586,93',
    'R$ 1.234,56',
    'Saldo: R$ 10,00 disponível',
    'Total R$ 500',
    'Texto sem valor monetário',
    '123,45 sem R$',
    'R$ 1.000.000,99 investido',
    'Percentual: 5.5% e valor R$ 25.000,00'
]

print("=== Testes da função is_valor_monetario ===")
for i, caso in enumerate(casos_teste, 1):
    resultado = is_valor_monetario(caso)
    print(f"Teste {i}: '{caso}' = {resultado}")
#para rodar chamar no terminarl python3 resource/utils/regex_money_utils.py

def compare_numbers_from_strings(str1, str2):
    """
    Recebe duas strings, extrai os números de cada uma e compara.
    Retorna False se o primeiro número for maior que o segundo, True caso contrário.
    """
    num1 = int(''.join(re.findall(r'\d+', str(str1))) or 0)
    num2 = int(''.join(re.findall(r'\d+', str(str2))) or 0)
    return 1 if (num1 < num2) else 0