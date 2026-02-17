# 🚀 AWS EC2 Infrastructure with Terraform & LocalStack

Este projeto demonstra o provisionamento de uma infraestrutura básica na AWS utilizando **Terraform** e emulação local via **LocalStack**. O deploy é automatizado através de um pipeline de **CI/CD no GitHub Actions**, garantindo que a infraestrutura seja validada e aplicada de forma consistente.



## 🛠️ Tecnologias Utilizadas

* **Terraform**: Ferramenta de Infraestrutura como Código (IaC) utilizada para definir e gerenciar os recursos.
* **LocalStack**: Emulador de serviços Cloud AWS utilizado para realizar testes de deploy sem custos.
* **GitHub Actions**: Automação do ciclo de vida de deploy através de jobs de Plan e Apply.
* **Nginx**: Servidor web instalado automaticamente na instância via script de `user_data`.

## 🏗️ Arquitetura do Projeto

O projeto utiliza uma estrutura **modular**, o que facilita a manutenção e segue as boas práticas de Cloud Engineering:

```text
.
├── main.tf            # Instância EC2 e chamada dos módulos
├── variables.tf       # Definição de variáveis globais
├── outputs.tf         # Outputs da raiz (Ex: ID da Instância)
├── modules/
│   └── network/       # Módulo isolado de rede
│       ├── main.tf    # Definição de VPC, Subnet e Security Group
│       ├── outputs.tf # Exportação de IDs (VPC_ID, Subnet_ID)
│       └── var.tf     # Variáveis específicas do módulo de rede
└── .github/workflows/
    └── terraform.yml  # Pipeline de automação (CI/CD)
```
## 🚀 Pipeline de CI/CD
O workflow no GitHub Actions foi estruturado em dois jobs principais para garantir a visibilidade do processo:

Terraform Plan: Valida a sintaxe do código e exibe as mudanças que serão realizadas.

Terraform Apply: Executa o provisionamento real dos recursos no ambiente do LocalStack.

Lição Aprendida: Para garantir a estabilidade no ambiente de CI, foi implementada uma dependência explícita (depends_on) e um tempo de espera (sleep) no workflow. Isso garante que os serviços de rede do LocalStack estejam totalmente prontos antes da criação da instância EC2, evitando erros de consistência eventual.

<img width="1338" height="436" alt="Captura de tela 2026-02-16 225732" src="https://github.com/user-attachments/assets/2d154d4c-d78a-4371-a9e5-d62c3b378a78" />

## Checando a infra criada no LocalStack:
1. Validar a Rede (VPC e Subnets)
Estes comandos confirmam se o módulo de rede foi processado corretamente pelo LocalStack.

Listar VPCs: <br>
aws --endpoint-url=http://localhost:4566 ec2 describe-vpcs --query "Vpcs[*].{ID:VpcId,CIDR:CidrBlock}" --output table
<img width="1082" height="269" alt="image" src="https://github.com/user-attachments/assets/a9c347c6-9ffd-4471-b595-10e265b7528c" />

Listar Subnets:<br>
aws --endpoint-url=http://localhost:4566 ec2 describe-subnets --query "Subnets[*].{ID:SubnetId,VPC:VpcId,CIDR:CidrBlock}" --output table
<img width="1093" height="291" alt="image" src="https://github.com/user-attachments/assets/14b11a68-b899-4743-a3b3-2dc2c86b8faf" />

2. Validar a Segurança (Security Groups)

Listar Security Groups:<br>
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --query "SecurityGroups[*].{Name:GroupName,ID:GroupId}" --output table
<img width="1096" height="199" alt="image" src="https://github.com/user-attachments/assets/65fb5060-5596-47b1-8053-205b9ab90a70" />

3. Validar a Computação (EC2) <br>
Este é o comando principal para ver se a instância "nasceu" 

Listar Instâncias e Status:<br>
aws --endpoint-url=http://localhost:4566 ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name,PublicIP:PublicIpAddress}" --output table
<img width="1001" height="83" alt="image" src="https://github.com/user-attachments/assets/f2d8507c-eb70-4137-a7c0-b8e20d2d2e4d" />


