# ecommerce_dashboard

Flutter e-commerce dashboard using BLoC and feature-first Clean Architecture.

## Project structure

```text
lib/
├── app/                  # App setup, routing, and dependency injection
├── core/                 # Shared infrastructure and reusable UI
└── features/
    ├── dashboard/
    ├── products/
    ├── orders/
    └── customers/
        ├── data/         # Data sources, models, repository implementations
        ├── domain/       # Entities, repository contracts, use cases
        └── presentation/ # BLoCs, pages, and feature widgets
```

Keep business rules in `domain`, framework/UI state in `presentation`, and
external data access in `data`. Presentation depends on domain; data implements
the repository contracts defined by domain.

## Getting started

Run `flutter pub get`, then `flutter run`.
