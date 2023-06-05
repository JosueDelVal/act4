import 'package:flutter/material.dart';

void main() => runApp(const Papeleria());

class Papeleria extends StatelessWidget {
  const Papeleria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarSuperior(),
    );
  }
}

class TabBarSuperior extends StatelessWidget {
  const TabBarSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'PaperClip',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.lightGreen,
            unselectedLabelColor: Colors.greenAccent,
            indicatorColor: Colors.lightGreen,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.verified_user),
                text: "Usuario",
              ),
              Tab(
                icon: Icon(Icons.category),
                text: "Producto",
              ),
              Tab(
                icon: Icon(Icons.local_shipping),
                text: "Distribuidor",
              ),
              Tab(
                icon: Icon(Icons.confirmation_num),
                text: "Ticket",
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const TabBarView(
                children: [
                  SizedBox(height: 5000, child: FormularioUsuario()),
                  SizedBox(height: 5000, child: FormularioProducto()),
                  SizedBox(height: 5000, child: FormularioDistribuidor()),
                  SizedBox(height: 5000, child: FormularioTicket()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class FormularioUsuario extends StatefulWidget {
  const FormularioUsuario({super.key});

  @override
  FormularioUsuarioEstado createState() {
    return FormularioUsuarioEstado();
  }
}

class FormularioUsuarioEstado extends State<FormularioUsuario> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su nombre completo",
                prefixIcon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su correo electronico",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return "Ingrese un correo valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su contraseña",
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  .hasMatch(value)) {
                return "Ingrese una contraseña valida";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese una dirección",
                prefixIcon: Icon(
                  Icons.pin,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su cumpleaños",
                prefixIcon: Icon(
                  Icons.cake,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r'^(?=.*?[0-9])(?=.*?[\/]).{8,}$')
                  .hasMatch(value)) {
                return "Ingrese una fecha valida";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese un numero telefonico",
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9].{9}$").hasMatch(value)) {
                return "Ingrese un numero valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese un usuario",
                prefixIcon: Icon(
                  Icons.verified_user,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text("Enviar"),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Envio exitoso')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FormularioProducto extends StatefulWidget {
  const FormularioProducto({super.key});

  @override
  FormularioProductoEstado createState() {
    return FormularioProductoEstado();
  }
}

class FormularioProductoEstado extends State<FormularioProducto> {
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese el nombre del producto",
                prefixIcon: Icon(
                  Icons.shop,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Tipo de producto",
                prefixIcon: Icon(
                  Icons.category,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Precio de producto",
                prefixIcon: Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r'^(?=.*?[0-9])(?=.*?[$])$').hasMatch(value)) {
                return "Ingrese una cantidad valida";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese la marca",
                prefixIcon: Icon(
                  Icons.apartment_rounded,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese el color del producto",
                prefixIcon: Icon(
                  Icons.color_lens_rounded,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingresa la cantidad disponible",
                prefixIcon: Icon(
                  Icons.commit_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9]$").hasMatch(value)) {
                return "Ingrese una cantidad valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese el ID de su distribuidor",
                prefixIcon: Icon(
                  Icons.co_present_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9].{12}$").hasMatch(value)) {
                return "Ingrese un ID valido";
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text("Enviar"),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey2.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Envio exitoso')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Create a Form widget.
class FormularioDistribuidor extends StatefulWidget {
  const FormularioDistribuidor({super.key});

  @override
  FormularioDistribuidorEstado createState() {
    return FormularioDistribuidorEstado();
  }
}

class FormularioDistribuidorEstado extends State<FormularioDistribuidor> {
  final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese el ID dado por su empresa",
                prefixIcon: Icon(
                  Icons.contact_page,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9].{12}$").hasMatch(value)) {
                return "Ingrese un ID valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingresa el nombre del distribuidor",
                prefixIcon: Icon(
                  Icons.contacts_rounded,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese la dirección del distribuidor",
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su numero telefonico",
                prefixIcon: Icon(
                  Icons.phone_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9].{10}$").hasMatch(value)) {
                return "Ingrese un numero valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su ciudad de residencia",
                prefixIcon: Icon(
                  Icons.apartment_rounded,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingresa el estado de residencia",
                prefixIcon: Icon(
                  Icons.apartment_rounded,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese el sitio web del distribuidor",
                prefixIcon: Icon(
                  Icons.public_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r'^(?=.*?[a-z])(?=.*?[.])$').hasMatch(value)) {
                return "Ingrese un sitio web valido";
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text("Enviar"),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey3.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Envio exitoso')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Create a Form widget.
class FormularioTicket extends StatefulWidget {
  const FormularioTicket({super.key});

  @override
  FormularioTicketEstado createState() {
    return FormularioTicketEstado();
  }
}

class FormularioTicketEstado extends State<FormularioTicket> {
  final _formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su nombre completo",
                prefixIcon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese el nombre del producto",
                prefixIcon: Icon(
                  Icons.shop,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingresa la cantidad a comprar",
                prefixIcon: Icon(
                  Icons.commit_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9]$").hasMatch(value)) {
                return "Ingrese una cantidad valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingresa la cantidad a pagar",
                prefixIcon: Icon(
                  Icons.commit_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9]$").hasMatch(value)) {
                return "Ingrese una cantidad valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingresa la dirección a enviar",
                prefixIcon: Icon(
                  Icons.apartment_rounded,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese su numero de contacto",
                prefixIcon: Icon(
                  Icons.phone_sharp,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r"[0-9].{10}$").hasMatch(value)) {
                return "Ingrese un numero valido";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Ingrese la fecha de compra",
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: Colors.green,
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor llene el campo';
              } else if (!RegExp(r'^(?=.*?[0-9])(?=.*?[\/]).{8,}$')
                  .hasMatch(value)) {
                return "Ingrese una fecha valida";
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text("Enviar"),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey4.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Envio exitoso')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
