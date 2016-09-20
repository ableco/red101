# Red101

## Dependencias

* Ruby: `~> 2.3.1`
* Postgres `~> 9.5.3`
* Redis `~> 3.0.1`

## Intro

El proyecto parte de una colaboración entre [Jorge Copello](https://github.com/cococopello)
y la empresa [Able.co](http://able.co), que busca desarrollar un sistema para realizar
autodiagnósticos y en base a estos recomendar recursos educativos en internet.

Se realizó una Hackathon de dos días para sentar la base, y el desarrollo continúa.

## Diseño Original (rama `react`)

* [Eder Reingifo](https://github.com/ederrengifo)

## Desarrollo

* [Paul Diaz Navarrete](https://github.com/paulrrdiaz)
* [Dante Cavero](https://github.com/DanteCavero)
* [Gianfranco Montoya](https://github.com/rothhound)
* [Gustavo Beathyate](https://github.com/goddamnhippie)

## API

### Endpoints Públicos

### Registrar un dispositivo (Iniciando Sesión)

`POST https://red101.tech/api/v1/device`

#### Parámetros
```
device: {
  email: 'test@example.com',
  password: 'supersecreto'
}
```

#### Retorna
Status: 201
```
user_id: 23,
token: '1234567890abcdef'
```

### Eliminar un dispositivo (Cerrando Sesión)

`DELETE https://red101.tech/api/v1/device`

#### Parámetros
Sin parámetros

#### Respuesta
Status: 200

### Registrar un usuario

`POST https://red101.tech/api/v1/users`

#### Parámetros
```
user: {
  name: 'Sr. Test',
  email: 'test@example.com',
  password: 'supersecreto'
}
```

#### Retorna
Status: 201
```
id: 23,
name: 'Sr. Test',
email: 'test@example.com',
token: '1234567890abcdef'
```

### Endpoints que requieren Autorización

La autorización del API se obtiene enviando el header `Authorization` con el formato de token estándar:

`Authorization: Token token=1234567890abcdef`

### Obtener los datos de usuario

`GET https://red101.tech/api/v1/users/23`

#### Parámetros
Sin parámetros

#### Retorna
Status: 200
```
user: {
  id: 23,
  name: 'Sr. Test',
  email: 'test@example.com'
}
```

### Actualizar un usuario

`PATCH https://red101.tech/api/v1/users/23`

#### Parámetros
```
user: {
  name: 'Sr. Test',
  email: 'test2@example.com',
  password: 'supersecreto'
}
```

#### Retorna
Status: 200
```
id: 23,
name: 'Sr. Test',
email: 'test2@example.com'
```

### Eliminar un usuario

`DELETE https://red101.tech/api/v1/users/23`

#### Parámetros
Sin parámetros

#### Retorna
Status: 200

### Obtener los temas

`GET https://red101.tech/api/v1/topics`

#### Parámetros
Sin parámetros

#### Retorna
Status: 200
```
[
  {
    id: 1,
    name: 'Cultura'
  },
  {
    id: 2,
    name: 'Innovación'
  },
  …
]
```

### Obtener las plantillas

`GET https://red101.tech/api/v1/templates`

#### Parámetros
Sin parámetros

#### Retorna
Status: 200
```
[
  {
    id: 1,
    name: 'Diagnostico de Cultura',
    topic_id: 1
  },
  {
    id: 2,
    name: 'Diagnóstico de Innovación',
    topic_id: 2
  },
  …
]
```

### Obtener los materiales

`GET https://red101.tech/api/v1/materials`

#### Parámetros
{
  page: 1
}

#### Retorna
Status: 200
```
[
  {
    id: 1,
    title: 'Lidezago Digital',
    url: 'http://example.com/liderazgo-digital',
    description: 'Temas del liderago',
    topic_id: 1
  },
  {
    id: 2,
    title: 'Innovación Digital',
    url: 'http://example.com/innovacion-digital',
    description: 'Temas del innovacion',
    topic_id: 2
  },
  …
]
```

### Gestión de Diagnósticos

TODO
