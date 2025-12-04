# Project Structure

## Root Directory

```
/
├── .kiro/                    # Kiro configuration and steering files
│   └── steering/             # AI assistant guidance documents
│       ├── app-building-rules.md    # Workshop-specific instructions
│       ├── game-style-guide.md      # Visual design guidelines
│       ├── product.md               # Product overview
│       ├── tech.md                  # Technology stack info
│       └── structure.md             # This file
├── .vscode/                  # VS Code workspace settings
├── kiro-logo.png            # Kiro branding asset for games
└── moon-lander.html         # Example game implementation
```

## File Organization Conventions

### Single-File Games
The example follows a single-file pattern with embedded styles and scripts for simplicity and portability.

### Multi-File Projects
When projects grow, follow this structure:
```
/
├── index.html               # Entry point
├── css/                     # Stylesheets
├── js/                      # Game logic
├── assets/                  # Images, sounds, sprites
└── lib/                     # Third-party libraries (if not using CDN)
```

## Steering Files

Located in `.kiro/steering/`, these guide AI behavior:
- **app-building-rules.md** - Workshop workflow and collaboration approach
- **game-style-guide.md** - Kiro brand colors and design patterns
- **user-context.md** - Created during workshop to store user preferences

## Development Approach

- Start with minimal implementations
- Keep files simple and readable
- Add complexity incrementally based on user feedback
- Maintain clear separation of concerns as projects grow
