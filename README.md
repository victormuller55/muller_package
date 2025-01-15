# Biblioteca de Componentes Flutter

Esta é uma biblioteca de componentes Flutter desenvolvida em Dart, projetada para facilitar a criação de aplicações, fornecendo componentes reutilizáveis e um sistema de serviço completo. O projeto foi desenvolvido utilizando o Android Studio.

## Componentes Criados

- **Formulários:** Campos de entrada otimizados para diferentes tipos de dados.
- **Dropdowns:** Menus suspensos estilizados e configuráveis.
- **Containers:** Layouts personalizados para organização de conteúdo.
- **Card:** Elementos visuais para exibição de informações.
- **Sistema de Service:** Implementação completa para realização de requisições em APIs.
- **Funções de Formatação, Validação e Masks:** Utilitários para manipulação de dados.

## Estrutura do Projeto

O projeto está organizado nas seguintes pastas:

- **componentes:** Contém todos os widgets reutilizáveis.
- **constantes:** Define constantes como cores, tamanhos, entre outros.
- **funções:** Inclui funções de formatação, validação e aplicação de masks.
- **models:** Define os modelos de erros utilizados pelo sistema de service.
- **service:** Contém a implementação completa para realizar requisições em APIs.

## Como Utilizar a Biblioteca

### 1. Instalação

Adicione a biblioteca ao arquivo `pubspec.yaml` do seu projeto:

```yaml
  dependencies:
    muller_package:
      path: ../muller_package
```

Certifique-se de que o projeto foi baixado e está na mesma pasta do projeto que irá utilizá-lo.

Em seguida, execute o comando:

```bash
flutter pub get
```

### 2. Importação de Componentes

Para utilizar um componente, importe-o no arquivo desejado. Por exemplo, para usar um campo de formulário:

```dart
import 'package:muller_package/muller_package.dart';
```

### 3. Exemplos de Uso

**Exemplo de Service:**
```dart
String endpoint = "http://localhost:3000/v1/example/items";

Future<List<ItemModel>> fetchItems() async {
  AppResponse response = await getHTTP(endpoint: "$endpoint/all");
  List<dynamic> jsonResponse = jsonDecode(response.body);
  List<ItemModel> items = jsonResponse.map((item) => ItemModel.fromJson(item)).toList();

  return items;
}
```

**Exemplo de Formulário:**
```dart
late AppFormField _descricaoProdutoForm;

@override
void initState() {
  _descricaoProdutoForm = AppFormField(
    context: context,
    hint: 'Nome do produto',
    icon: const Icon(Icons.shopping_cart),
    width: 300,
    radius: AppRadius.small,
  );

  super.initState();
}

_descricaoProdutoForm.formulario,
```

## Observações

- Certifique-se de que todas as dependências estão atualizadas.
- Personalize os componentes conforme a necessidade do seu projeto.

---

Para dúvidas ou sugestões, entre em contato com Victor Muller.
