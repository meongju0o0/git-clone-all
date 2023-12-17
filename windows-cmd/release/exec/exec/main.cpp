#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
	string username;
	cout << "Enter Username:";
	cin >> username;
	cout << endl << endl;

	string pkg_install = "powershell -ExecutionPolicy Bypass -File pkg-install.ps1";
	const char* _pkg_install = pkg_install.c_str();

	string clone_repos = "clone-repos.bat --";
	clone_repos.append(username);
	const char* _clone_repos = clone_repos.c_str();

	int pkg_result = system(_pkg_install);
	int clone_result = system(_clone_repos);
	
	return EXIT_SUCCESS;
}
