import re

def extrair_valor_monetario(texto):
    import re
    texto = texto.replace('\xa0', ' ')
    # Sempre retorna uma lista, mesmo que só com um valor ou vazia
    return re.findall(r'R\$\s*([\d\.,]+)', texto, re.DOTALL)

def is_valor_monetario(texto):
    """
    Verifica se a string contém um valor monetário brasileiro válido.
    
    Args:
        texto (str): String a ser verificada
        
    Returns:
        int: 1 se for um valor monetário válido, 0 caso contrário
        
    Examples:
        is_valor_monetario("R$ 1.234,56") -> 1
        is_valor_monetario("R$ 10,00") -> 1
        is_valor_monetario("R$ 1.000.000,99") -> 1
        is_valor_monetario("Texto qualquer") -> 0
        is_valor_monetario("123,45") -> 0
    """
    if not texto or not isinstance(texto, str):
        return 0
    
    # Remove espaços não-quebráveis
    texto_limpo = texto.replace('\xa0', ' ').strip()
    
    # Padrão para valor monetário brasileiro completo
    # R$ seguido de valor com formato brasileiro (pontos para milhares, vírgula para decimais)
    padrao_monetario = r'^R\$\s*[0-9]{1,3}(?:\.[0-9]{3})*(?:,[0-9]{2})?$'
    
    if re.match(padrao_monetario, texto_limpo):
        return 1
    else:
        return 0

