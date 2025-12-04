# 🚀 Retro Moon Lander

A classic arcade-style lunar lander game built with vanilla JavaScript and HTML5 Canvas. Navigate your spacecraft through space, manage your fuel, and land safely on designated pads to rack up points!

![Kiro Logo](kiro-logo.png)

## 🎮 Play Now

**[Play the game online!](http://moon-lander-homage.s3-website.us-east-2.amazonaws.com/)**

## 🎯 Features

- **Realistic Physics**: Gravity and momentum-based flight mechanics
- **Fuel Management**: Strategic fuel consumption adds challenge
- **Scoring System**: Earn points by landing on pads
  - Standard pads: 1 point
  - Bonus pad (purple): 2 points
- **High Score Tracking**: Beat your personal best
- **Visual Feedback**: Dynamic thrust flames and speed warnings
- **Retro Aesthetic**: Classic arcade styling with modern polish

## 🕹️ Controls

- **UP Arrow / SPACE**: Main thrust (vertical)
- **LEFT Arrow**: Left thrust
- **RIGHT Arrow**: Right thrust
- **SPACE / Click**: Start game / Restart after landing or crash

## 🎓 Landing Tips

- Keep your vertical speed below **1.5** (shown in red when too fast)
- Keep your horizontal speed below **1.0** (shown in red when too fast)
- Watch your fuel gauge - running out means game over!
- The purple pad is smaller but awards double points

## 🛠️ Technology Stack

- **HTML5 Canvas** for rendering
- **Vanilla JavaScript** for game logic and physics
- **CSS3** for styling
- No build tools required - runs directly in the browser!

## 🚀 Running Locally

1. Clone this repository
2. Open `moon-lander.html` in your web browser
3. That's it! No installation or build process needed.

Alternatively, use a local web server:
```bash
python -m http.server 8000
# Then visit http://localhost:8000/moon-lander.html
```

## 🧪 Testing

Property-based tests are included using fast-check. Open `moon-lander-tests.html` in your browser to run the test suite.

## 🎨 Design

Built with Kiro brand colors:
- **Purple (#790ECB)**: Bonus landing pad
- **Orange (#ff8c00)**: Standard pads and UI elements
- **Dark theme**: Retro space aesthetic

## 📝 License

Created as part of the AWS re:Invent workshop on game development with AI assistance.

---

**Happy Landing! 🌙**
