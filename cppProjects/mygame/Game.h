#ifndef GAME_INCLUDED
#define GAME_INCLUDED
#include <bits/stdc++.h>
#include <SDL2/SDL.h>

class Game{
public:
    Game();
    bool Initialize();
    void RunLoop();
    void Shutdown();
private:
    void ProcessInput();
    void UpdateGame();
    void GenerateOutput();
    SDL_Window* mWindow;
    bool mIsRunning;
};

Game::Game();
#endif // GAME_INCLUDED
