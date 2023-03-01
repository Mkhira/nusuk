




enum SendEmailTypes{
  forgetPassword,
  verifyEmail
}

enum ProfileType{
  editProfile('Edit profile'),
  signUp('Sign Up'),
  completeProfile('Complete Profile');

  const ProfileType(this.value);
  final String value;
}