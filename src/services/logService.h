#ifndef LOGSERVICE_H
#define LOGSERVICE_H

#include <iostream>

namespace Services
{
    class LogService
	{
	public:
        static void trace(const std::string &msg)
        {
            std::cout << msg << std::endl;
        }

        static void trace(const char* &msg)
        {
            std::cout << msg << std::endl;
        }
    };
}

#endif // LOGSERVICE_H
