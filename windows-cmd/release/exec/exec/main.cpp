#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
	string username;
	cout << "Enter Username:";
	cin >> username;
	cout << endl;

	int pkg_result = system("pkg-install.ps1");
	int clone_result = system("clone-repos.bat");
	
	return EXIT_SUCCESS;
}
