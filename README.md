# Mon SMS PRO (Dart Library)

## Introduction

My SMS PRO est une application mobile permettant d'envoyer des SMS PRO en masse.
Bien que basée en Côte d’Ivoire, la plateforme permet d’envoyer des SMS partout dans le monde.
Il s'agit de la documentation dédiée aux développeurs souhaitant envoyer des SMS PRO ou POP UP Flash via une application tierce.

## Bibliothèques & Restful API

Nous disposons de 2 Bibliothèques ainsi qu'une API Restful qui vous permettra d'avoir une intégration plus fluide.

- La Bibliothèque Javascript est compatible avec TypeScript.
- La Bibliothèque Dart est compatible avec Flutter.
- Vous pouvez utiliser le Restful API pour tout autre language.

## Clé API

Afin d'utiliser les différentes bibliothèques ou l'API Restful vous devrez fournir votre clé API qui est disponible dans la section paramètres de l'application [Mon SMS PRO](https://onelink.to/kg2z8q). <br />
Une fois que vous avez récupéré cette clé dans votre presse-papier, suivez les instructions selon votre choix.

## Documentation

Rendez-vous sur [notre site Web](https://docs.monsms.pro/libs/dart/get-started) pour plus d'informations.

## 🗄️ Hive Database Management

This project includes automated Hive database management for local storage. See [Hive Automation Documentation](docs/HIVE_AUTOMATION.md) for details.

### Quick Commands

```bash
# Update Hive registrars and build adapters
make hive-full

# Watch for changes
make hive-watch

# Clean build cache
make hive-clean
```

### Pre-commit Hook (Recommended)

Install the pre-commit hook for automatic Hive updates:

```bash
ln -s ../../scripts/pre_commit_hook.sh .git/hooks/pre-commit
```
