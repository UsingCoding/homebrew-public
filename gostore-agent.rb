# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GostoreAgent < Formula
  desc "Agent to expose ssh keys stored in gostore over ssh-agent"
  homepage "https://github.com/UsingCoding/gostore"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/UsingCoding/gostore-agent/releases/download/v1.0.0/gostore-agent_1.0.0_darwin_x86_64.tar.gz"
      sha256 "259b983fd9c83e471dfc5eb63e0e0574ebcf59a70a2d8b540e686093a7944629"

      def install
        bin.install "gostore-agent"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/UsingCoding/gostore-agent/releases/download/v1.0.0/gostore-agent_1.0.0_darwin_arm64.tar.gz"
      sha256 "5993d37c5c9f5ad26586182f859b0879e69faef0d1629935baac10f7867a65c0"

      def install
        bin.install "gostore-agent"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/UsingCoding/gostore-agent/releases/download/v1.0.0/gostore-agent_1.0.0_linux_x86_64.tar.gz"
        sha256 "f852d7e51e126c791387298c95b4b41ad4df97a50f7887387b779cee8d488fd9"

        def install
          bin.install "gostore-agent"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/UsingCoding/gostore-agent/releases/download/v1.0.0/gostore-agent_1.0.0_linux_arm64.tar.gz"
        sha256 "f07e4f94fafa562a236d8e020a3faeaef0a6afada49731ff632237d5403b6f3a"

        def install
          bin.install "gostore-agent"
        end
      end
    end
  end

  def post_install
    (var/"run").mkpath
    system "#{bin}/gostore-agent", "install"
  end

  service do
    run [opt_bin/"gostore-agent", "ssh", "-s", var/"run/gostore-agent.sock"]
    keep_alive true
    log_path var/"log/gostore-agent.log"
    error_log_path var/"log/gostore-agent.log"
  end
end
