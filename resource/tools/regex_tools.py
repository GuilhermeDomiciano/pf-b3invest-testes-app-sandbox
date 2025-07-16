import re
    
def extract_token_from_content(content: bytes) -> str:
        try:
            body = content.decode("utf-8")
        except Exception as e:
            raise ValueError(f"Erro ao decodificar o conteúdo do e-mail: {e}")

        match = re.search(r"\b\d{6}\b", body)
        if not match:
            raise ValueError("Nenhum token de 6 dígitos encontrado no corpo do e-mail.")
        return match.group(0)