# 🎮 ASUS GPU Tweak III — Tradução para Português do Brasil (PT-BR) 🇧🇷

![Versão](https://img.shields.io/badge/Tradução-v1.0.0-blue?style=for-the-badge)
![Idioma](https://img.shields.io/badge/Idioma-Português%20(Brasil)-green?style=for-the-badge)

Tradução PT-BR do **ASUS GPU Tweak III**, atualizada a partir do arquivo de localização mantido por **Emerson Teles**. O pacote inclui instalação por script, restauração do arquivo inglês e instalação manual.

## 📋 Índice

1. [Sobre a tradução](#-sobre-a-tradução)
2. [Versão compatível do programa](#-versão-compatível-do-programa)
3. [Download](#-download)
4. [Instalação pelo script](#-instalação-pelo-script)
5. [Instalação manual](#-instalação-manual)
6. [Restaurar o arquivo original](#-restaurar-o-arquivo-original)
7. [Por que o arquivo se chama asengxml](#-por-que-o-arquivo-se-chama-asengxml)
8. [Créditos](#-créditos)

---

## 🌟 Sobre a tradução

O pacote usa o arquivo inglês presente na instalação do GPU Tweak III 2.1.9.5 como estrutura de referência e aplica nele as traduções de `aseng-pt-br.xml` mantidas por Emerson Teles. O arquivo final mantém as 1.083 linhas do original. Foram traduzidas também as nove chaves novas, incluindo os avisos e opções de desligamento automático por sobrecorrente. As chaves antigas que não existem mais no arquivo inglês atual não são carregadas na versão final.

O arquivo de idioma se chama `aseng.xml` para que o programa o carregue. O conteúdo está em português brasileiro, mas o nome técnico original precisa ser preservado.

## 🧩 Versão compatível do programa

Esta atualização foi preparada usando o arquivo de idioma da versão estável **2.1.9.5**, publicada pela ASUS em 18/09/2026. Baixe o programa pela [página oficial brasileira do ASUS GPU Tweak III](https://www.asus.com/campaign/GPU-Tweak-III/br).

O pacote não inclui o instalador do GPU Tweak III. A tradução continua válida para os textos e IDs já incluídos. Uma atualização do aplicativo pode reinstalar o arquivo inglês; basta executar o script novamente. A ASUS também pode adicionar novas chaves em versões futuras: isso não altera as chaves traduzidas existentes, mas textos novos podem aparecer em inglês até serem incluídos numa revisão da tradução.

## 📦 Download

Baixe `GPU-Tweak-III-Traducao-PTBR-v1.0.0.zip` na seção [Releases](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR/releases/latest). O ZIP contém somente `Iniciar-Traducao.bat` e o arquivo XML da tradução; este README fica na página do repositório.

## 🚀 Instalação pelo script

1. Extraia o ZIP para qualquer pasta ou unidade e mantenha os dois arquivos juntos.
2. Dê dois cliques em `Iniciar-Traducao.bat`.
3. Autorize a solicitação do Windows para executar com privilégios de administrador.
4. Na janela gráfica, escolha **Instalar tradução** ou **Restaurar inglês**.
5. Se a instalação não estiver no caminho padrão, selecione a pasta do GPU Tweak III.

O `.bat` funciona em qualquer pasta ou unidade, inclusive pendrive e disco externo. Ele procura automaticamente a instalação nas unidades conectadas; se necessário, permite selecionar a pasta. Qualquer arquivo `.xml` da tradução pode ficar ao lado do `.bat`, com qualquer nome. O instalador copia o conteúdo para a pasta do programa usando o nome obrigatório `aseng.xml`. Se não encontrar nenhum XML, exibirá: **“Tradução não localizada. Coloque o arquivo XML da tradução no mesmo diretório do instalador.”**

Ao instalar ou restaurar, o programa fecha antes de substituir o arquivo. Em seguida, escolha **Sim (S)** para abrir o GPU Tweak III atualizado ou **Não (N)** para fechar o instalador sem iniciar o programa.

Na instalação, o script salva o arquivo inglês como `_aseng.xml` na própria pasta do jogo. Se uma atualização da ASUS colocar um `aseng.xml` inglês novo, ao instalar novamente o script atualiza o backup para preservar essa versão. Ao restaurar, o instalador copia `_aseng.xml` de volta para `aseng.xml` e apaga o backup temporário; uma instalação futura da tradução cria um novo backup.

## 🛠️ Instalação manual

1. Feche o GPU Tweak III.
2. Abra a pasta de instalação, normalmente `C:\Program Files (x86)\ASUS\GPUTweakIII`.
3. Se ainda não existir, faça uma cópia do arquivo original `aseng.xml` e renomeie a cópia para `_aseng.xml` na mesma pasta.
4. Copie o `aseng.xml` deste pacote para a pasta do programa e confirme a substituição.
5. Abra novamente o GPU Tweak III.

## 🔄 Restaurar o arquivo original

Execute `Iniciar-Traducao.bat`, clique em **Restaurar inglês** e confirme a pasta do programa, se solicitado. O instalador copia `_aseng.xml` de volta para `aseng.xml`, exclui o backup após a restauração e pergunta se deseja abrir o programa.

O backup é mantido na pasta do jogo. Não o apague se quiser poder restaurar o idioma original.

## 🏷️ Por que o arquivo se chama `aseng.xml`

O GPU Tweak III procura o idioma inglês pelo identificador/nome `aseng.xml`. Renomear o arquivo para `pt-br.xml`, `português.xml` ou outro nome não registra um novo idioma: o programa simplesmente não carrega a tradução. Por isso, o pacote substitui o `aseng.xml` em uso e conserva o original com o nome `_aseng.xml` para restauração.

## 👤 Créditos

Tradução PT-BR e atualização: **Emerson Teles**.

O ASUS GPU Tweak III é propriedade da ASUS. Este projeto comunitário não é oficial nem afiliado à ASUS.

---

## 👤 Sobre o Autor

Desenvolvido e mantido por **Emerson Teles** (conhecido na comunidade como **Emertels**).

Entusiasta de tecnologia, informática, jogos, manutenção de sistemas e tradução/localização de softwares para Português do Brasil (PT-BR).

### 🛠️ Projetos & Contribuições

- **[Cursor — Tradução PT-BR](https://github.com/Emertels/Cursor-Traducao-PTBR)** — Localização do Cursor AI para Português do Brasil.
- **[Antigravity — Tradução PT-BR](https://github.com/Emertels/Antigravity-Traducao-PTBR)** — Localização do Google Antigravity Desktop.
- **[Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores)** — Suíte PowerShell para baixar e atualizar emuladores e frontends.
- **[PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator)** — Ferramentas de tradução e localização para o PSBBN Definitive Project.
- **[AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault)** — Backup e recuperação de conversas locais de assistentes de IA.
- **[Silent Hill: Homecoming — Tradução PT-BR](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR)** — Tradução brasileira para PC.

---

### 🌐 Conecte-se comigo & Comunidades Oficiais

<div align="left">

[![GitHub](https://img.shields.io/badge/GitHub-Emertels-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/emertels)
[![Website](https://img.shields.io/badge/Website-Emerson_Teles-0070F3?style=for-the-badge&logo=googlechrome&logoColor=white)](https://emertels.github.io)
[![Discord](https://img.shields.io/badge/Discord-Emertels%20Server-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://emertels.github.io/discord)
[![X / Twitter](https://img.shields.io/badge/X_Twitter-@emertels-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/emertels)
[![YouTube](https://img.shields.io/badge/YouTube-Emerson_Teles-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@emersonteles2379)
[![Telegram](https://img.shields.io/badge/Telegram-Aplicativos%20Mods-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/apksmodsandroid)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-Apoiar%20Projeto-FF5E5B?style=for-the-badge&logo=kofi&logoColor=white)](https://ko-fi.com/emertels)

</div>
