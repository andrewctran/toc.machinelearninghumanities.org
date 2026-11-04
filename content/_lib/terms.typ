// Every term in the bestiary, in display order. A term's page is
// `content/<handle>.typ`, where the handle is the name with spaces as hyphens.
// Status is "open" (no steward yet), "in-flight" (being written) or
// "complete".
#let TERMS = (
  (name: "alignment", status: "open"),
  (name: "artificial general intelligence", status: "open"),
  (name: "artificial intelligence", status: "open"),
  (name: "attention", status: "open"),
  (name: "base model", status: "open"),
  (name: "benchmarking", status: "open"),
  (name: "chain-of-thought", status: "open"),
  (name: "context window", status: "open"),
  (name: "counterfactuality", status: "open"),
  (name: "eliza effect", status: "open"),
  (name: "embedding", status: "open"),
  (name: "feature", status: "open"),
  (name: "few shot", status: "open"),
  (name: "fine tuning", status: "open"),
  (name: "gpu", status: "open"),
  (name: "hallucination", status: "open"),
  (name: "homogenization effects", status: "open"),
  (name: "inference", status: "open"),
  (name: "latent space", status: "open"),
  (name: "llm", status: "open"),
  (name: "multimodality", status: "open"),
  (name: "neural net", status: "open"),
  (name: "pre-training", status: "open"),
  (name: "prompt engineering", status: "open"),
  (name: "prompt injection", status: "open"),
  (name: "quanta", status: "open"),
  (name: "reasoning", status: "open"),
  (name: "red teaming", status: "open"),
  (name: "reinforcement learning", status: "open"),
  (name: "scale", status: "open"),
  (name: "slop", status: "open"),
  (name: "superposition", status: "open"),
  (name: "temperature", status: "open"),
  (name: "tokenization", status: "open"),
  (name: "transformer", status: "open"),
  (name: "turing test", status: "open"),
  (name: "vector space", status: "open"),
  (name: "vibe coding", status: "open"),
  (name: "world model", status: "open"),
)

#let handle(name) = name.replace(" ", "-")

#let STATUS-LABEL = (
  open: "open",
  in-flight: "in flight",
  complete: "complete",
)
