int angle = 0;

void main()
{
	LoadScene("scenes/main.esc", "OnStart", "OnLoop");
	EnableQuitKeys(true);
// Prefer setting window properties in the app.enml file
	SetWindowProperties("Ethanon Engine", 1024, 768, true, true, PF32BIT);
}

void OnStart()
{
    
}

void OnLoop()
{	
	ETHEntity @entidadePersonagem = SeekEntity("person.ent"); 
	vector2 centroTela = GetScreenSize() / 2; 
	SetCameraPos(entidadePersonagem.GetPositionXY() - centroTela);
}

void ETHCallback_person(ETHEntity@ person) {

	ETHInput@ input = GetInputHandle();
	
	if(input.KeyDown(K_UP)) {
		person.AddToPositionXY(vector2(angle, -20.0f));
		//SetCameraPos(vector2(0,-256+person.GetPositionY()));
	}	
	if(input.KeyDown(K_DOWN)) {
		//SetCameraPos(vector2(0,-256+person.GetPositionY()));
	}
	if(input.KeyDown(K_LEFT)) {
		person.AddToAngle(1);
		if((angle < -180)&&(angle > 180)) {
		angle--;
		} else {
		angle++;
		}
	}
	if(input.KeyDown(K_RIGHT)) {
		person.AddToAngle(-1);
		if((angle < 180)&&(angle > -180)) {
		angle++;
		} else {
		angle--;
		}
	}
}
