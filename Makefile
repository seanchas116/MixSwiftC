SWIFT_LIBS_PATH = /Library/Developer/Toolchains/swift-2.2-SNAPSHOT-2016-03-01-a.xctoolchain/usr/lib/swift/macosx

Main: Main.o CModule.o
	clang -L$(SWIFT_LIBS_PATH) -Wl,-rpath,$(SWIFT_LIBS_PATH) Main.o CModule.o -o Main
Main.o:
	swift -frontend -emit-object -I CModule Main.swift
CModule.o:
	clang -c CModule/CModule.c -o CModule.o
