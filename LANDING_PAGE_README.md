# 📄 Documentação da Landing Page - Unit Converter

## 📁 Arquivos Criados

### 1. **landing-page.html** - Landing Page Principal
Página de divulgação completa com:
- Hero section com CTAs
- Seção de funcionalidades (6 cards)
- Grid com 8 categorias de conversão
- Como funciona (3 passos)
- Estatísticas
- FAQ
- Footer completo

**Como visualizar:**
```bash
# Abra diretamente no navegador:
start landing-page.html
```

---

### 2. **politica-privacidade.html** - Política de Privacidade
Página obrigatória para publicação nas lojas.

**Destaques:**
- Confirma que não coletamos dados
- Explica funcionamento 100% offline
- Sem rastreamento ou anúncios
- Formato profissional e completo

**Como visualizar:**
```bash
start politica-privacidade.html
```

---

### 3. **descricao-app.txt** - Descrição Curta
Texto simples para uso geral (redes sociais, sites, etc.)

---

### 4. **descricao-google-play.txt** - Descrição Google Play
Texto otimizado para a Google Play Store com:
- Emojis para melhor visualização
- Seções organizadas
- Palavras-chave SEO
- Formato compatível com a loja

---

### 5. **descricao-app-store.txt** - Descrição App Store
Texto otimizado para Apple App Store:
- Formato mais conciso (requisito da Apple)
- Sem emojis excessivos
- Foco em benefícios claros

---

### 6. **keywords.txt** - Palavras-chave
Lista de keywords para otimização ASO (App Store Optimization)

---

### 7. **CHECKLIST_PUBLICACAO.txt** - Checklist Completo
Guia passo a passo para publicar nas lojas com:
- Informações necessárias
- Recursos gráficos
- Tamanhos de imagens
- Dicas de screenshots
- Timeline de aprovação

---

## 🌐 Hospedagem da Landing Page

### Opção 1: GitHub Pages (Gratuito)
```bash
# 1. Criar repositório no GitHub
# 2. Fazer upload dos arquivos HTML
# 3. Ativar GitHub Pages nas configurações
# URL final: https://seuusuario.github.io/unit-converter
```

### Opção 2: Vercel (Gratuito)
```bash
# 1. Criar conta no Vercel
# 2. Conectar repositório ou fazer upload direto
# 3. Deploy automático
# URL: https://unit-converter.vercel.app
```

### Opção 3: Netlify (Gratuito)
```bash
# Arraste e solte os arquivos HTML no Netlify Drop
# URL: https://unit-converter.netlify.app
```

---

## 📸 Capturas de Tela para as Lojas

### Screenshots Sugeridos:

**1. Tela Home (Principal)**
- Mostre o grid com 8 categorias coloridas
- Adicione texto: "8 Categorias de Conversão"

**2. Tela de Conversão**
- Exemplo: "100 Metros = 328.08 Pés"
- Texto: "Resultados Instantâneos"

**3. Onboarding**
- Primeira tela do onboarding
- Texto: "100% Offline - Funciona em Qualquer Lugar"

**4. Múltiplas Categorias**
- Mostre 2-3 exemplos de conversões diferentes
- Texto: "Mais de 50 Unidades Diferentes"

### Tamanhos:
- **Google Play:** 1080x1920px ou 1080x2340px
- **App Store:** 1284x2778px (iPhone 13/14) ou 1290x2796px (iPhone 14 Pro)

---

## ✅ Checklist Antes de Publicar

### Google Play Store:
- [ ] Descrição em português e inglês
- [ ] Ícone 512x512px
- [ ] Mínimo 2 screenshots
- [ ] Banner de recursos 1024x500px
- [ ] Política de privacidade (URL pública)
- [ ] AAB assinado: `flutter build appbundle --release`

### Apple App Store:
- [ ] Descrição em português e inglês
- [ ] Ícone 1024x1024px
- [ ] Mínimo 3 screenshots iPhone
- [ ] Política de privacidade (URL pública)
- [ ] Conta Apple Developer ($99/ano)
- [ ] Build IPA: `flutter build ios --release`

---

## 🎨 Personalização

### Alterar Cores:
No `landing-page.html`, procure:
```javascript
tailwind.config = {
    theme: {
        extend: {
            colors: {
                'primary': '#FFAE14',    // Altere aqui
                'secondary': '#15203D',  // Altere aqui
                'accent': '#FF5963'      // Altere aqui
            }
        }
    }
}
```

### Alterar Contatos:
Procure por:
- `contato@unitconverter.com`
- `www.unitconverter.com`
- Links de redes sociais

---

## 📱 Publicação da Política de Privacidade

**IMPORTANTE:** As lojas exigem uma URL pública.

### Opções:
1. **GitHub Pages:** Hospede junto com a landing page
2. **Google Sites:** Gratuito e fácil
3. **Medium/Notion:** Publique como artigo público
4. **Seu próprio site**

**URL final exemplo:** 
`https://seuusuario.github.io/unit-converter/politica-privacidade.html`

---

## 💡 Dicas Finais

1. **Teste tudo** antes de enviar para as lojas
2. **Screenshots de qualidade** aumentam downloads em 30%
3. **Descrição clara** = mais aprovações
4. **Política de privacidade** é OBRIGATÓRIA
5. **Responda reviews** dos usuários

---

## 🚀 Pronto para Publicar!

Você tem tudo que precisa:
- ✅ App funcional
- ✅ Landing page profissional
- ✅ Descrições otimizadas
- ✅ Política de privacidade
- ✅ Checklist completo

**Boa sorte com a publicação! 🎉**

