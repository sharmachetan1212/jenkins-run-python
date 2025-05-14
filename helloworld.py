import os
import pwd
import grp

def list_users():
    users = [user.pw_name for user in pwd.getpwall()]
    print("\nUsers:")
    for user in users:
        print(user)

def list_groups():
    groups = [group.gr_name for group in grp.getgrall()]
    print("\nGroups:")
    for group in groups:
        print(group)

def list_filesystem():
    print("\nFile System Structure:")
    for root, dirs, files in os.walk("/"):
        print(f"{root}/")
        for dir in dirs:
            print(f"  [DIR] {dir}")
        for file in files:
            print(f"  [FILE] {file}")

if __name__ == "__main__":
    list_users()
    list_groups()
    list_filesystem()