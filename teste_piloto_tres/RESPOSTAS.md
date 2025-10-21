1. Gerenciamento de Estado: Como você usou o setState() para garantir que o "Valor Total" fosse atualizado quando a quantidade de um item mudava?
    Utilizei o setState sempre que o usuario atulizava os itens no carrinho.
2. Refatoração: O que é "extrair um widget"? Dê um exemplo de uma parte da sua UI de hoje que você extrairia para um novo widget Stateless ou Stateful e por quê.
    Nesse exemplo, o component CartItems precisa ser um StatefulWidget, porque atualizar a UI e necessario toda vez que o usuario interaje com o appp, ja a MyApp StatelessWidget porque nao ppossui nenhum interacao com o usuario.
3. Performance: Se esta lista de carrinho tivesse 1.000 itens, usar um ListView simples (como você provavelmente fez) poderia causar problemas de performance. Qual construtor do ListView resolve isso e por quê?
    Uma listView simples traria problemas de performance, pois ao carregar o estado inicial da tela o flutter vai carregar todos os items independente se eles estarao na tela ou nao, desse modo utilizando memoria que poderia estar livre.
4. 