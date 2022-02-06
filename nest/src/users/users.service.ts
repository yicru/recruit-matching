import { Injectable } from '@nestjs/common';
import { CreateUserInput } from './dto/create-user.input';
import { UpdateUserInput } from './dto/update-user.input';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
  private users: User[] = [
    {
      id: 1,
      name: 'miyamae',
    },
  ];

  create(createUserInput: CreateUserInput): User {
    const newUser: User = {
      id: this.users.length + 1,
      name: createUserInput.name,
    };

    this.users = [...this.users, newUser];

    return newUser;
  }

  findAll(): User[] {
    return this.users;
  }

  findOne(id: number): User {
    return this.users.find((user) => user.id === id);
  }

  update(id: number, updateUserInput: UpdateUserInput): User {
    const targetUser = this.findOne(id);

    targetUser.name = updateUserInput.name;

    return targetUser;
  }

  remove(id: number): User {
    const targetUser = this.findOne(id);
    this.users = this.users.filter((user) => user.id !== id);

    return targetUser;
  }
}
