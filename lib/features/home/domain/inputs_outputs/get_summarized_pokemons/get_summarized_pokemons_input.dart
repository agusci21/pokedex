class GetSummarizedPokemonsInput {
  final int? offset;
  final int limit;

  const GetSummarizedPokemonsInput({
    required this.offset,
    this.limit = 60,
  });
}
