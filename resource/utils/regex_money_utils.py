import re

def extrair_valor_monetario(texto):
    import re
    texto = texto.replace('\xa0', ' ')
    # Sempre retorna uma lista, mesmo que só com um valor ou vazia
    return re.findall(r'R\$\s*([\d\.,]+)', texto, re.DOTALL)
