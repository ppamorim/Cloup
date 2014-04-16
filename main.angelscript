#include "eth_util.angelscript"


void main()
{
	LoadScene("scenes/main.esc", "OnStart", "OnLoop");
	AddToCameraPos(vector2(-256.0f, -256.0f));
	EnableQuitKeys(true);
	ETHEntity @circled;
	// Prefer setting window properties in the app.enml file
	SetWindowProperties("Ethanon Engine", 1024, 768, true, true, PF32BIT);
}

void OnStart()
{
    
}

void OnLoop()
{

}

void ETHCallback_person(ETHEntity@ person) {

	ETHInput@ input = GetInputHandle();
	
	if(input.KeyDown(K_UP)) {
		person.AddToPositionXY(vector2(0.0f, -20.0f));
		SetCameraPos(vector2(0,-256+person.GetPositionY()));
	}	
	if(input.KeyDown(K_DOWN)) {
		SetCameraPos(vector2(0,-256+person.GetPositionY()));
		
	}
	if(input.KeyDown(K_LEFT)) {
		person.AddToAngle(1);
	}
	if(input.KeyDown(K_RIGHT)) {
		person.AddToAngle(-1);
	}
}
