#!/usr/bin/env python
import sys, os

def StudentAdd():
    print("\nStudent Added")

def StudentDel():
    print("\nStudent Deleted")

def StudentLook():
    print("\nStudent Record Found")

def Error001():
    print("\nNot A Valied Choice Try Again...")

#clear screen before to show menu,
os.system('clear')

ans=True
while ans:
    print("""
    Simple Menu:
    ------------

    1. Add a Student
    2. Delete a Student
    3. Look Up Student Record
    4. Exit/Quit
    """)
    ans=raw_input("what would you like to do? ")
    if ans=="1":
        StudentAdd()
        print("\nPress Enter...")
        raw_input()
#        wait()
        os.system('clear')
    elif ans=="2":
        StudentDel()
        print("\nPress Enter...")
        raw_input()
#        wait()
        os.system('clear')
    elif ans=="3":
        StudentLook
        print("\nPress Enter...")
        raw_input()
#        wait()
        os.system('clear')
    elif ans=="4":
        print("\nGoodbye.....")
        ans = None
    else:
        Error001()
        print("\nPress Enter...")
        raw_input()
#        wait()
        os.system('clear')
        ans = True
